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

ActiveRecord::Schema[7.0].define(version: 2023_09_14_123917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_tracker_categories", force: :cascade do |t|
    t.bigint "cash_tracker_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cash_tracker_id"], name: "index_cash_tracker_categories_on_cash_tracker_id"
    t.index ["category_id"], name: "index_cash_tracker_categories_on_category_id"
  end

  create_table "cash_trackers", force: :cascade do |t|
    t.bigint "categories_id", null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_cash_trackers_on_categories_id"
    t.index ["user_id"], name: "index_cash_trackers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cash_tracker_categories", "cash_trackers"
  add_foreign_key "cash_tracker_categories", "categories"
  add_foreign_key "cash_trackers", "categories", column: "categories_id"
  add_foreign_key "cash_trackers", "users"
  add_foreign_key "categories", "users"
end
