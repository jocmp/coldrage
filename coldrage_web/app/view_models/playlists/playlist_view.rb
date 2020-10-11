module Playlists
  class PlaylistView
    def initialize(playlist)
      @playlist = playlist
    end

    def spotify_id
      playlist.id
    end

    def playlist_name
      playlist.name
    end

    def playlist_tracks
      playlist.tracks
    end

    private

    attr_reader :playlist
  end
end
