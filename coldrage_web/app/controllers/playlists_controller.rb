# typed: true
class PlaylistsController < ApplicationController
  def index
    @playlists = fetch_playlists
  end

  def show
    @playlist = Coldrage::SpotifyPlaylists.find(spotify_id: spotify_id)
  end

  def backup
    backup = Backup.new

    record = Coldrage::SpotifyPlaylists.create(spotify_id: spotify_id)
    SnapshotPlaylistWorker.perform_async(record.spotify_id)

    flash[:notice] = "Saved"

    redirect_to playlist_path(record.spotify_id)
  end

  private

  def fetch_playlists
    return [] if query.blank?
    Coldrage::SpotifyPlaylists.search(query: query)
  end

  def query
    params[:q]
  end

  def spotify_id
    params[:spotify_id]
  end
end
