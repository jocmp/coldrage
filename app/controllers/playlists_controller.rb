class PlaylistsController < ApplicationController
  def index
    @playlists = find_playlists
  end

  private

  def find_playlists
    return [] unless current_user.logged_in?

    current_user.as_spotify_user.playlists
  end
end
