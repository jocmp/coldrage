# typed: true
module Coldrage
  module SpotifyPlaylists
    class << self
      def search(query:, remote_playlists: RSpotify::Playlist)
        remote_playlists.search(query)
      end

      def find(spotify_id:)
        Coldrage.spotify_playlists.find(spotify_id: spotify_id)
      end

      def create(spotify_id:)
        Coldrage.spotify_playlists.create(spotify_id: spotify_id)
      end

      def snapshot(spotify_id:, remote_playlists: RSpotify::Playlist)
        Coldrage.spotify_playlists.snapshot(playlist: remote_playlists.find_by_id(spotify_id))
      end

      def build_record(remote_playlist)
        Playlist.new(
          spotify_id: remote_playlist.id,
          snapshot: Snapshot.new(payload: remote_playlist.as_json)
        )
      end
    end

    Playlist = Struct.new(
      :id,
      :created_at,
      :spotify_id,
      :snapshot,
      keyword_init: true
    )

    Snapshot = Struct.new(
      :created_at,
      :payload,
      keyword_init: true
    )
  end
end
