# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180409204459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "panel_types", force: :cascade do |t|
    t.string "name"
    t.string "total_area"
    t.string "visible_area"
    t.string "security_area"
    t.string "impression"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "panels", force: :cascade do |t|
    t.bigint "panel_type_id"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["panel_type_id"], name: "index_panels_on_panel_type_id"
    t.index ["station_id"], name: "index_panels_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations_lines", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "line_id"
    t.index ["line_id"], name: "index_stations_lines_on_line_id"
    t.index ["station_id"], name: "index_stations_lines_on_station_id"
  end

  add_foreign_key "panels", "panel_types"
  add_foreign_key "panels", "stations"
  add_foreign_key "stations_lines", "lines"
  add_foreign_key "stations_lines", "stations"
end
