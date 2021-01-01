class CreateWatcher < ActiveRecord::Migration[6.1]
  def change
    create_table :watchers do |t|
      t.string :playlist_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
