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

ActiveRecord::Schema.define(version: 20170704180651) do

  create_table "researchers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "employee_no"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "researches", force: :cascade do |t|
    t.string   "title"
    t.string   "status"
    t.datetime "date_started"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "fund_source"
    t.string   "zone"
    t.string   "commodity"
    t.string   "discipline"
    t.string   "sector"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "employee_no"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
