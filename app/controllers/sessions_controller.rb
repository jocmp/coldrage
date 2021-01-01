class SessionsController < ApplicationController
  def spotify_callback
    redirect_to playlists_path
  end
end
