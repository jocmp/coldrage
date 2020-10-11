module SpotifyPlaylists
  class << self
    def find(spotify_id:)
      record = SpotifyPlaylist.find_by(spotify_id: spotify_id)
      return if record.nil?

      most_recent_backup = BackupSnapshot.where(backup: Backup.find_by(remote_entity: record)).order(created_at: :desc).limit(1).first

      build_record_from_database(record, most_recent_backup)
    end

    #
    # @param spotify_id [String] Spotify Playlist ID
    #
    # @return [SpotifyPlaylists::Record]
    #
    def create(spotify_id:)
      record = SpotifyPlaylist.create!(spotify_id: spotify_id)

      build_record_from_database(record)
    end

    #
    # @param playlist [RSpotify::Playlist] Playlist to serialize and snapshot
    #
    # @return [nil]
    #
    def snapshot(playlist:)
      ApplicationRecord.transaction do
        record = SpotifyPlaylist.find_or_create_by!(spotify_id: playlist.id)
        backup = Backup.find_or_create_by!(remote_entity: record)
        BackupSnapshot.create!(backup: backup, payload: playlist.as_json)
      end
      nil
    end

    private

    def build_record_from_database(record, backup = nil)
      Record.new(
        id: record.id,
        created_at: record.created_at,
        spotify_id: record.spotify_id,
        payload: backup&.payload
      )
    end
  end

  Record = Struct.new(
    :id,
    :created_at,
    :spotify_id,
    :payload,
    keyword_init: true
  )
end
