# require "./coldrage/playlist_snapshot"
require "rspotify"

module Coldrage
  class Error < StandardError
  end

  class << self
    def authenticate(id:, secret:)
      RSpotify.authenticate(id, secret)
    end

    def playlists(query:)
      RSpotify::Playlist.search(query)
    end

    attr_accessor :playlist_snapshot
  end
end
