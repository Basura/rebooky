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

ActiveRecord::Schema.define(version: 20170419163552) do

  create_table "bookings", force: :cascade do |t|
    t.integer "property_id"
    t.integer "contact_id"
    t.index ["contact_id"], name: "index_bookings_on_contact_id"
    t.index ["property_id"], name: "index_bookings_on_property_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "peak_seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peak_seasons_properties", force: :cascade do |t|
    t.integer "property_id"
    t.integer "peak_season_id"
    t.index ["peak_season_id"], name: "index_peak_seasons_properties_on_peak_season_id"
    t.index ["property_id"], name: "index_peak_seasons_properties_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "frequency"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.integer  "bedrooms"
    t.integer  "sleeps"
    t.integer  "recreational_type"
    t.integer  "home_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
