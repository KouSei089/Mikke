# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_12_112647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diaries", force: :cascade do |t|
    t.string "title"
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creativity", default: 0
    t.bigint "user_id"
    t.float "emotion_point", default: 0.0
    t.integer "word_count"
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "diary_sentiments", force: :cascade do |t|
    t.bigint "diary_id"
    t.bigint "sentiment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diary_id"], name: "index_diary_sentiments_on_diary_id"
    t.index ["sentiment_id"], name: "index_diary_sentiments_on_sentiment_id"
  end

  create_table "sentiments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "soliloquies", force: :cascade do |t|
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.float "emotion_point", default: 0.0
    t.index ["user_id"], name: "index_soliloquies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diaries", "users"
  add_foreign_key "diary_sentiments", "sentiments"
  add_foreign_key "soliloquies", "users"
end
