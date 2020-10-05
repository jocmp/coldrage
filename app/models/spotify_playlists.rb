module SpotifyPlaylists
  class << self
    #
    # @param spotify_id [String] Spotify Playlist ID
    #
    # @return [SpotifyPlaylists::Record]
    #
    def create(spotify_id:)
      record = SpotifyPlaylist.create!(spotify_id: spotify_id)

      SpotifyPlaylists::Record.new(
        id: record.id,
        spotify_id: record.spotify_id
      )
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
  end

  Record = Struct.new(
    :id,
    :spotify_id,
    keyword_init: true
  )
end
