require "coldrage/version"
require "rspotify"

module Coldrage
  class Error < StandardError
  end

  def self.authenticate(id:, secret:)
    RSpotify.authenticate(id, secret)
  end

  def self.playlists(query:)
    RSpotify::Playlist.search(query)
  end
end
