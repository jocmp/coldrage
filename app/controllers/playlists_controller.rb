class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.as_spotify_user.playlists
  end
end
