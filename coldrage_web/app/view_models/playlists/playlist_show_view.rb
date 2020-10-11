module Playlists
  class PlaylistShowView
    def initialize(playlist)
      @playlist = playlist
    end

    def playlist_name
      snapshot.payload["name"]
    end

    def tracks
      snapshot.payload&.fetch("tracks_cache", [])
    end

    def show_backup_button?
      playlist.id.nil?
    end

    def playlist_backup_date
      if snapshot.created_at
        "Latest sync at #{snapshot.created_at.to_formatted_s(:iso8601)}"
      elsif playlist.id
        "Sync queued at #{playlist.created_at.to_formatted_s(:iso8601)}"
      else
        "Not synced yet"
      end
    end

    private

    attr_reader :playlist
    delegate :snapshot, to: :playlist
  end
end
