require "rspotify"

module Coldrage
  autoload :SpotifyPlaylists, "coldrage/spotify_playlists"

  class Error < StandardError
  end

  class << self
    def authenticate(id:, secret:)
      RSpotify.authenticate(id, secret)
    end

    attr_accessor :spotify_playlists
  end
end
