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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_173825) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "nius_user_id", null: false
    t.bigint "niu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["niu_id"], name: "index_comments_on_niu_id"
    t.index ["nius_user_id"], name: "index_comments_on_nius_user_id"
  end

  create_table "nius", force: :cascade do |t|
    t.bigint "nius_user_id", null: false
    t.string "title"
    t.string "headline"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nius_user_id"], name: "index_nius_on_nius_user_id"
  end

  create_table "nius_users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_nius_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_nius_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "nius"
  add_foreign_key "comments", "nius_users"
  add_foreign_key "nius", "nius_users"
end
