# typed: false
class AddBackupSnapshots < ActiveRecord::Migration[6.0]
  def change
    create_table :backup_snapshots do |t|
      t.references :backup, index: true, null: false
      t.jsonb :payload, null: false
      t.timestamps
    end
  end
end
