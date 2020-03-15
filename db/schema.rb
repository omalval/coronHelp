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

ActiveRecord::Schema.define(version: 2020_03_15_004922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "garde_categories", force: :cascade do |t|
    t.bigint "garde_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_garde_categories_on_category_id"
    t.index ["garde_id"], name: "index_garde_categories_on_garde_id"
  end

  create_table "gardes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "contact"
    t.integer "quantity_max"
    t.date "start_availability_date"
    t.date "end_availability_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gardes_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "reservation_quantity", default: 0
    t.date "pick_up_date", default: "2020-03-15"
    t.text "reservation_comment"
    t.string "status", default: "en attente"
    t.bigint "user_id"
    t.bigint "garde_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garde_id"], name: "index_reservations_on_garde_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "garde_categories", "categories"
  add_foreign_key "garde_categories", "gardes"
  add_foreign_key "gardes", "users"
  add_foreign_key "reservations", "gardes"
  add_foreign_key "reservations", "users"
end
