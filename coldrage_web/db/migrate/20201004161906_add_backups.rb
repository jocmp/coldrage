# typed: true
class AddBackups < ActiveRecord::Migration[6.0]
  def change
    create_table :backups do |t|
      t.references :remote_entity, polymorphic: true, index: true, null: false
      t.timestamps
    end
  end
end
