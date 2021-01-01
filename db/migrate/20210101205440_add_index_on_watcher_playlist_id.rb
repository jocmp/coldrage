class AddIndexOnWatcherPlaylistId < ActiveRecord::Migration[6.1]
  def change
    add_index(:watchers, [:user_id, :playlist_id], unique: true)
  end
end
