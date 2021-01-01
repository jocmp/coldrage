class User < ApplicationRecord
  alias_method :logged_in?, :persisted?

  def as_spotify_user
    RSpotify::User.new(auth)
  end
end
