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

ActiveRecord::Schema.define(version: 20180418230954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid", default: false
    t.string "title"
    t.integer "status", default: 0
    t.index ["company_id"], name: "index_campaigns_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "cnpj"
    t.string "name"
    t.string "street_number"
    t.string "address1"
    t.string "address2"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "date"
    t.integer "duration"
    t.integer "quantity"
    t.bigint "campaign_id"
    t.bigint "panel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ad_art"
    t.integer "price_cents", default: 0, null: false
    t.string "art"
    t.index ["campaign_id"], name: "index_orders_on_campaign_id"
    t.index ["panel_id"], name: "index_orders_on_panel_id"
  end

  create_table "panel_types", force: :cascade do |t|
    t.string "name"
    t.string "total_area"
    t.string "visible_area"
    t.string "security_area"
    t.string "impression"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.integer "price_cents", default: 0, null: false
  end

  create_table "panels", force: :cascade do |t|
    t.bigint "panel_type_id"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "picture"
    t.index ["panel_type_id"], name: "index_panels_on_panel_type_id"
    t.index ["station_id"], name: "index_panels_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "sigla"
  end

  create_table "stations_lines", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "line_id"
    t.index ["line_id"], name: "index_stations_lines_on_line_id"
    t.index ["station_id"], name: "index_stations_lines_on_station_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "orders", "campaigns"
  add_foreign_key "orders", "panels"
  add_foreign_key "panels", "panel_types"
  add_foreign_key "panels", "stations"
  add_foreign_key "stations_lines", "lines"
  add_foreign_key "stations_lines", "stations"
end
