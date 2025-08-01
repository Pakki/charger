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

ActiveRecord::Schema[8.0].define(version: 2025_04_14_063547) do
  create_table "clients", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "phone_number", limit: 11, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_number"], name: "index_clients_on_phone_number", unique: true
  end

  create_table "connectors", force: :cascade do |t|
    t.integer "station_id", null: false
    t.integer "connector_type", limit: 4, null: false
    t.integer "state", limit: 4, default: 1, null: false
    t.decimal "power", precision: 10, scale: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_connectors_on_station_id"
  end

  create_table "points", force: :cascade do |t|
    t.string "title", limit: 200, null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "connector_id", null: false
    t.integer "client_id", null: false
    t.decimal "charged", precision: 10, scale: 3
    t.datetime "started_at", null: false
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_sessions_on_client_id"
    t.index ["connector_id"], name: "index_sessions_on_connector_id"
  end

  create_table "stations", force: :cascade do |t|
    t.integer "point_id", null: false
    t.string "sn", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_id"], name: "index_stations_on_point_id"
  end

  add_foreign_key "connectors", "stations"
  add_foreign_key "sessions", "clients"
  add_foreign_key "sessions", "connectors"
  add_foreign_key "stations", "points"
end
