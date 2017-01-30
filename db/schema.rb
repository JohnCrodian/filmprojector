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

ActiveRecord::Schema.define(version: 20170130164529) do

  create_table "calendars", force: :cascade do |t|
    t.date     "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.string   "avatar_file_size"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "posts_screenings", force: :cascade do |t|
    t.integer "screening_id"
    t.integer "post_id"
    t.index ["post_id"], name: "index_posts_screenings_on_post_id"
    t.index ["screening_id"], name: "index_posts_screenings_on_screening_id"
  end

  create_table "screenings", force: :cascade do |t|
    t.string "title"
    t.date   "showtime"
    t.string "location"
    t.string "link"
  end

end
