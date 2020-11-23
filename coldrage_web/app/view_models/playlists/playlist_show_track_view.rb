# typed: true
module Playlists
  class PlaylistShowTrackView
    def initialize(cached_track)
      @cached_track = cached_track
    end

    def track_name
      cached_track["name"]
    end

    def track_artists
      cached_track["artists"].map { |artist| artist["name"] }.join(", ")
    end

    def track_url
      cached_track.dig("external_urls", "spotify")
    end

    private

    attr_reader :cached_track
  end
end
