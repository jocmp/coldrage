# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_01_205440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backups", force: :cascade do |t|
    t.string "snapshot_id"
    t.bigint "watcher_id", null: false
    t.jsonb "tracks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["watcher_id"], name: "index_backups_on_watcher_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.jsonb "auth"
  end

  create_table "watchers", force: :cascade do |t|
    t.string "playlist_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "playlist_id"], name: "index_watchers_on_user_id_and_playlist_id", unique: true
    t.index ["user_id"], name: "index_watchers_on_user_id"
  end

  add_foreign_key "backups", "watchers"
  add_foreign_key "watchers", "users"
end
