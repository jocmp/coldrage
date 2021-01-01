namespace :watchers do
  desc "Backup each watched playlist"
  task backup_playlist: :environment do
    Watcher.find_each do |watcher|
      spotify_playlist = RSpotify::Playlist.find_by_id(watcher.playlist_id)

      Backup.create!(
        snapshot_id: spotify_playlist.snapshot_id,
        tracks: spotify_playlist.tracks,
        watcher: watcher
      )
    end
  end
end
