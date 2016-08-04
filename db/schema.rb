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

ActiveRecord::Schema.define(version: 20160804063948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "journals", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date"
    t.text     "improvement"
    t.text     "q1answers"
    t.text     "q2answers"
    t.text     "q3answers"
    t.text     "q4answers"
    t.integer  "user_id"
    t.integer  "happiness"
    t.boolean  "meditation"
    t.boolean  "task_complete"
    t.integer  "masturbation"
  end

  add_index "journals", ["user_id"], name: "index_journals_on_user_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.text     "lesson"
    t.integer  "journal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lessons", ["journal_id"], name: "index_lessons_on_journal_id", using: :btree

  create_table "metrics", force: :cascade do |t|
    t.integer  "happiness"
    t.boolean  "meditation"
    t.boolean  "task_complete"
    t.integer  "masturbation"
    t.integer  "journal_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "metrics", ["journal_id"], name: "index_metrics_on_journal_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wins", force: :cascade do |t|
    t.text     "win"
    t.integer  "journal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wins", ["journal_id"], name: "index_wins_on_journal_id", using: :btree

  add_foreign_key "lessons", "journals"
  add_foreign_key "metrics", "journals"
  add_foreign_key "wins", "journals"
end
