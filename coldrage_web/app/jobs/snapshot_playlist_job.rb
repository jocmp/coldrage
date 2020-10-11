class SnapshotPlaylistJob < ApplicationJob
  queue_as :default

  def perform(spotify_id)
    Coldrage::SpotifyPlaylists.snapshot(spotify_id: spotify_id)
  end
end
