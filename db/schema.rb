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

ActiveRecord::Schema.define(version: 20151117024346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_parts", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "muscle_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "body_parts", ["exercise_id"], name: "index_body_parts_on_exercise_id", using: :btree
  add_index "body_parts", ["muscle_group_id"], name: "index_body_parts_on_muscle_group_id", using: :btree

  create_table "exercise_details", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "user_id"
    t.integer  "initial_test_id"
    t.integer  "workout_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "exercise_details", ["exercise_id"], name: "index_exercise_details_on_exercise_id", using: :btree
  add_index "exercise_details", ["initial_test_id"], name: "index_exercise_details_on_initial_test_id", using: :btree
  add_index "exercise_details", ["user_id"], name: "index_exercise_details_on_user_id", using: :btree
  add_index "exercise_details", ["workout_id"], name: "index_exercise_details_on_workout_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "youtube_url"
    t.string   "proper_form_text"
    t.boolean  "cardio"
    t.boolean  "requires_gem"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "initial_tests", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "initial_tests", ["user_id"], name: "index_initial_tests_on_user_id", using: :btree

  create_table "muscle_groups", force: :cascade do |t|
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "muscle_groups", ["exercise_id"], name: "index_muscle_groups_on_exercise_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_windows", force: :cascade do |t|
    t.integer  "schedule_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "workout_windows", ["schedule_id"], name: "index_workout_windows_on_schedule_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "initial_test_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "workouts", ["initial_test_id"], name: "index_workouts_on_initial_test_id", using: :btree
  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree

  add_foreign_key "body_parts", "exercises"
  add_foreign_key "body_parts", "muscle_groups"
  add_foreign_key "exercise_details", "exercises"
  add_foreign_key "exercise_details", "initial_tests"
  add_foreign_key "exercise_details", "users"
  add_foreign_key "exercise_details", "workouts"
  add_foreign_key "goals", "users"
  add_foreign_key "initial_tests", "users"
  add_foreign_key "muscle_groups", "exercises"
  add_foreign_key "schedules", "users"
  add_foreign_key "workout_windows", "schedules"
  add_foreign_key "workouts", "initial_tests"
  add_foreign_key "workouts", "users"
end