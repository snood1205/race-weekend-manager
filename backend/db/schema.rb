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

ActiveRecord::Schema[7.1].define(version: 2024_05_08_174841) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "number", null: false
    t.string "make"
    t.string "model"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id", null: false
    t.index ["team_id"], name: "index_cars_on_team_id"
  end

  create_table "personnel", force: :cascade do |t|
    t.string "name", null: false
    t.string "position"
    t.bigint "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id", null: false
    t.index ["car_id"], name: "index_personnel_on_car_id"
    t.index ["team_id"], name: "index_personnel_on_team_id"
  end

  create_table "team_administrators", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest"
    t.string "token"
    t.datetime "token_expires_at"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_team_administrators_on_email"
    t.index ["refresh_token"], name: "index_team_administrators_on_refresh_token", unique: true
    t.index ["team_id"], name: "index_team_administrators_on_team_id"
    t.index ["token"], name: "index_team_administrators_on_token", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tires", force: :cascade do |t|
    t.integer "position"
    t.string "serial_number"
    t.string "manufacturer"
    t.integer "compound"
    t.boolean "on_car", default: false, null: false
    t.integer "laps_on_tire", default: 0, null: false
    t.bigint "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_tires_on_car_id"
  end

  add_foreign_key "cars", "teams"
  add_foreign_key "personnel", "cars"
  add_foreign_key "personnel", "teams"
  add_foreign_key "team_administrators", "teams"
  add_foreign_key "tires", "cars"
end
