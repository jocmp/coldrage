class PlaylistsController < ApplicationController
  def index
    if request.env["omniauth.auth"].nil?
      redirect_to auth_spotify_sessions_path
    end
  end
end
