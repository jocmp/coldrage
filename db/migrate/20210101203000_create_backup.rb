class CreateBackup < ActiveRecord::Migration[6.1]
  def change
    create_table :backups do |t|
      t.string :snapshot_id
      t.references :watcher, null: false, foreign_key: true
      t.jsonb :tracks

      t.timestamps
    end
  end
end
