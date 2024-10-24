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

ActiveRecord::Schema[7.0].define(version: 2024_10_24_191731) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "club_name"
    t.string "school"
    t.time "meet_time"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "white"
    t.integer "black"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player_name_white"
    t.string "player_name_black"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_name"
    t.integer "number_of_questions"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "instructor_id"
    t.string "description"
  end

  create_table "student_lessons", force: :cascade do |t|
    t.integer "student_id"
    t.integer "lesson_id"
    t.integer "lesson_grade"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "student_name"
    t.integer "grade"
    t.integer "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "station"
  end

end
