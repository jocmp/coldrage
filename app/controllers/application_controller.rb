class ApplicationController < ActionController::Base
  def spotify_user
    RSpotify::User.new(request.env["omniauth.auth"])
  end
end
