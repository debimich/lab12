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

ActiveRecord::Schema[7.1].define(version: 2024_01_21_115850) do
  create_table "definitions", force: :cascade do |t|
    t.integer "User_id", null: false
    t.string "def"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_definitions_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "values", force: :cascade do |t|
    t.integer "User_id", null: false
    t.integer "Definition_id", null: false
    t.string "val"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Definition_id"], name: "index_values_on_Definition_id"
    t.index ["User_id"], name: "index_values_on_User_id"
  end

  add_foreign_key "definitions", "Users"
  add_foreign_key "values", "Definitions", on_delete: :cascade
  add_foreign_key "values", "Users", on_delete: :cascade
end
