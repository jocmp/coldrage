module Coldrage
  module SpotifyPlaylists
    class << self
      def search(query:, remote_playlists: RSpotify::Playlist)
        remote_playlists.search(query)
      end

      def find(spotify_id:, remote_playlists: RSpotify::Playlist)
        remote_playlists.find_by_id(spotify_id)
      end

      def create(spotify_id:)
        Coldrage.spotify_playlists.create(spotify_id: spotify_id)
      end

      def snapshot(spotify_id:, remote_playlists: RSpotify::Playlist)
        Coldrage.spotify_playlists.snapshot(playlist: remote_playlists.find_by_id(spotify_id))
      end
    end
  end
end
