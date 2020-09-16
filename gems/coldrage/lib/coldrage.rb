require "coldrage/version"
require "rspotify"

module Coldrage
  class Error < StandardError
  end

  def self.authenticate(id:, secret:)
    RSpotify.authenticate(id, secret)
  end

  def self.albums
    RSpotify::Artist.search("Emancipator").first.albums
  end
end
