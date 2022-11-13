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

ActiveRecord::Schema[7.0].define(version: 2022_11_11_135023) do
  create_table "tickets", force: :cascade do |t|
    t.integer "user_id"
    t.string "title", limit: 255
    t.text "description", limit: 1000
    t.date "due_date"
    t.integer "status_id", default: 1
    t.integer "progress", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255
    t.string "name", limit: 255
    t.string "phone", limit: 60
    t.integer "notification_method", default: 1
    t.boolean "send_due_date_reminder", default: true
    t.integer "due_date_reminder_interval", default: 0
    t.time "due_date_reminder_time", default: "2000-01-01 09:00:00"
    t.string "time_zone", limit: 60, default: "CET"
    t.boolean "status", default: true
    t.boolean "deleted", default: false
    t.boolean "locked", default: false
    t.string "unlock_token"
    t.integer "login_attempts", default: 0
    t.integer "failed_attempts", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  add_foreign_key "tickets", "users"
end
