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

ActiveRecord::Schema.define(version: 20201211004329) do

  create_table "areas", force: :cascade do |t|
    t.string "code", limit: 3
    t.string "name"
  end

  create_table "employees", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "title_id"
  end

  create_table "entry_types", force: :cascade do |t|
    t.string "code"
    t.string "description"
  end

  create_table "job_areas", force: :cascade do |t|
    t.integer "job_id"
    t.integer "area_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string  "job_number"
    t.string  "name"
    t.string  "customer"
    t.integer "jobsite_id"
  end

  create_table "jobsite_employees", force: :cascade do |t|
    t.integer "jobsite_id"
    t.integer "employee_id"
  end

  create_table "jobsites", force: :cascade do |t|
    t.string "name"
  end

  create_table "tasks", force: :cascade do |t|
    t.string  "code",       limit: 3
    t.string  "name"
    t.integer "jobsite_id"
  end

  create_table "time_entries", force: :cascade do |t|
    t.datetime "workdate"
    t.integer  "jobsite_id"
    t.integer  "employee_id"
    t.integer  "job_id"
    t.integer  "area_id"
    t.integer  "task_id"
    t.decimal  "hours"
    t.integer  "entry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string "title"
  end

  create_table "user_jobsites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "jobsite_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
  end

end
