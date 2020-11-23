# typed: false
module SpotifyPlaylists
  class << self
    def find(spotify_id:)
      record = SpotifyPlaylist.find_by(spotify_id: spotify_id)
      return empty_playlist if record.nil?

      snapshot = BackupSnapshot.where(backup_id: Backup.select(:id).find_by(remote_entity: record)).order(created_at: :desc).limit(1).first

      ::Coldrage::SpotifyPlaylists::Playlist.new(
        id: record.id,
        created_at: record.created_at,
        spotify_id: record.spotify_id,
        snapshot: build_snapshot(snapshot)
      )
    end

    def create(spotify_id:)
      record = SpotifyPlaylist.find_or_create_by!(spotify_id: spotify_id)

      ::Coldrage::SpotifyPlaylists::Playlist.new(
        id: record.id,
        created_at: record.created_at,
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
        playlist_record = SpotifyPlaylist.find_by!(spotify_id: playlist.id)
        backup = Backup.find_or_create_by!(remote_entity: playlist_record)
        BackupSnapshot.create!(backup: backup, payload: playlist.as_json)
      end
      nil
    end

    private

    def empty_playlist
      ::Coldrage::SpotifyPlaylists::Playlist.new(snapshot: empty_snapshot)
    end

    def build_snapshot(snapshot)
      return empty_snapshot if snapshot.nil?

      ::Coldrage::SpotifyPlaylists::Snapshot.new(
        created_at: snapshot.created_at,
        payload: snapshot.payload
      )
    end

    def empty_snapshot
      ::Coldrage::SpotifyPlaylists::Snapshot.new(payload: {})
    end
  end
end
