class CreateSpotifyPlaylist < ActiveRecord::Migration[6.0]
  def change
    create_table :spotify_playlists do |t|
      t.string :spotify_id, index: {unique: true}
      t.timestamps
    end
  end
end
