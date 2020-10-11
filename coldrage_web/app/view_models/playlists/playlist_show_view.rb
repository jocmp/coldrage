module Playlists
  class PlaylistShowView
    def initialize(playlist)
      @playlist = playlist
    end

    def show_syncing?
      playlist.id && playlist.payload.nil?
    end

    def playlist_name
      playlist.payload['name']
    end

    def tracks
      playlist.payload&.fetch("tracks_cache", [])
    end

    def show_backup_button?
      playlist.id.nil?
    end

    def playlist_backup_date
      playlist.created_at.to_formatted_s(:iso8601)
    end

    private

    attr_reader :playlist
  end
end
