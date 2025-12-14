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

ActiveRecord::Schema[8.0].define(version: 2025_12_14_202553) do
  create_table "item_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "kanji_name", null: false
    t.string "kana_name", null: false
    t.boolean "recyclable", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "eng_name", null: false
    t.string "kana_name"
    t.string "kanji_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eng_name"], name: "index_items_on_eng_name", unique: true
  end

  create_table "municipalities", force: :cascade do |t|
    t.string "eng_name", null: false
    t.string "kana_name", null: false
    t.string "kanji_name", null: false
    t.string "municipality_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id", null: false
    t.index ["prefecture_id"], name: "index_municipalities_on_prefecture_id"
    t.check_constraint "municipality_type IN ('ward', 'city', 'town', 'village')", name: "municipality_type_check"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "eng_name", null: false
    t.string "kana_name", null: false
    t.string "kanji_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eng_name", "kanji_name", "kana_name"], name: "index_prefectures_on_all_names", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.string "username", null: false
    t.string "role", default: "standard", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.check_constraint "role IN ('standard', 'admin')", name: "role_check"
  end

  add_foreign_key "municipalities", "prefectures"
  add_foreign_key "sessions", "users"
end
