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

ActiveRecord::Schema.define(version: 20170901091049) do

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "research_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["research_id"], name: "index_projects_on_research_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

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
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "fund_source"
    t.string   "zone"
    t.string   "commodity"
    t.string   "discipline"
    t.string   "sector"
    t.date     "date_started"
    t.text     "abstract"
    t.string   "technology"
    t.string   "thematic_area"
    t.string   "province"
    t.string   "municipality"
    t.string   "barangay"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "research_id"
    t.integer  "researcher_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["research_id"], name: "index_tasks_on_research_id"
    t.index ["researcher_id"], name: "index_tasks_on_researcher_id"
  end

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
    t.string   "username"
    t.integer  "role"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
