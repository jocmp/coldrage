namespace :watchers do
  desc "Backup each watched playlist"
  task backup_playlist: :environment do
    Watcher.find_each do |watcher|
      Backup.create!(
        snapshot_id: watcher.playlist.snapshot_id,
        tracks: watcher.playlist.tracks,
        watcher: watcher
      )
    end
  end
end
