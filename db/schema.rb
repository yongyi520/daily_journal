# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160727072648) do

  create_table "journals", force: :cascade do |t|
    t.text     "content",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "date"
    t.text     "improvement", limit: 65535
    t.text     "q1answers",   limit: 65535
    t.text     "q2answers",   limit: 65535
    t.text     "q3answers",   limit: 65535
    t.text     "q4answers",   limit: 65535
    t.integer  "user_id",     limit: 4
  end

  add_index "journals", ["user_id"], name: "index_journals_on_user_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.text     "lesson",     limit: 65535
    t.integer  "journal_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lessons", ["journal_id"], name: "index_lessons_on_journal_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wins", force: :cascade do |t|
    t.text     "win",        limit: 65535
    t.integer  "journal_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "wins", ["journal_id"], name: "index_wins_on_journal_id", using: :btree

  add_foreign_key "lessons", "journals"
  add_foreign_key "wins", "journals"
end
