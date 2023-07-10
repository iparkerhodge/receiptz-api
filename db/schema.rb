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

ActiveRecord::Schema[7.0].define(version: 2023_07_10_183654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "receipts", force: :cascade do |t|
    t.string "title", null: false
    t.string "accusee"
    t.date "collection_date"
    t.text "claims", default: [], array: true
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_number", default: "", null: false
    t.string "password_digest"
    t.index ["mobile_number"], name: "index_users_on_mobile_number", unique: true
  end

  add_foreign_key "receipts", "users"
end
