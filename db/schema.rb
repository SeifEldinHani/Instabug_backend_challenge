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

ActiveRecord::Schema[7.0].define(version: 2022_04_07_011940) do
  create_table "apps", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "app_token"
    t.integer "chat_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_token"], name: "index_apps_on_app_token", unique: true
  end

  create_table "chats", charset: "latin1", force: :cascade do |t|
    t.integer "chat_number", null: false
    t.integer "messages_count", null: false
    t.string "app_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_token"], name: "fk_rails_08c3435968"
    t.index ["chat_number"], name: "index_chats_on_chat_number"
  end

  create_table "messages", charset: "latin1", force: :cascade do |t|
    t.integer "message_number", null: false
    t.text "body", null: false
    t.string "app_token", null: false
    t.integer "chat_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_token"], name: "fk_rails_bbc41ca7bc"
    t.index ["chat_number"], name: "index_messages_on_chat_number"
    t.index ["message_number"], name: "index_messages_on_message_number"
  end

  add_foreign_key "chats", "apps", column: "app_token", primary_key: "app_token"
  add_foreign_key "messages", "apps", column: "app_token", primary_key: "app_token"
end
