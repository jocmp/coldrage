class PlaylistsController < ApplicationController
  def index
    @albums = fetch_playlists
  end

  private

  def fetch_playlists
    return [] if query.blank?
    Coldrage.playlists(query: query)
  end

  def query
    params[:q]
  end
end
