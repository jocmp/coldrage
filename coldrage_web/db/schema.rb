# typed: false
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_04_163248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backup_snapshots", force: :cascade do |t|
    t.bigint "backup_id", null: false
    t.jsonb "payload", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["backup_id"], name: "index_backup_snapshots_on_backup_id"
  end

  create_table "backups", force: :cascade do |t|
    t.string "remote_entity_type", null: false
    t.bigint "remote_entity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["remote_entity_type", "remote_entity_id"], name: "index_backups_on_remote_entity_type_and_remote_entity_id"
  end

  create_table "spotify_playlists", force: :cascade do |t|
    t.string "spotify_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spotify_id"], name: "index_spotify_playlists_on_spotify_id", unique: true
  end

end
