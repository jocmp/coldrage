class PlaylistsController < ApplicationController
  def index
    @albums = fetch_playlists
  end

  def take_snapshot
    
  end

  private

  def fetch_playlists
    return [] if query.blank?
    Coldrage.playlists(query: query)
  end

  def query
    params[:q]
  end

  def playlist_id
    params[:playlist_id]
  end
end
