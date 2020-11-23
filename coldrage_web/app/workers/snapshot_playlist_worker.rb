# typed: true
class SnapshotPlaylistWorker
  include Sidekiq::Worker

  def perform(spotify_id)
    Coldrage::SpotifyPlaylists.snapshot(spotify_id: spotify_id)
  end
end
