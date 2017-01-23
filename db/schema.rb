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

ActiveRecord::Schema.define(version: 20170120195430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "about"
    t.string   "location"
    t.string   "contact"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "seniors", force: :cascade do |t|
    t.integer  "care_group_id"
    t.string   "name"
    t.string   "about"
    t.string   "location"
    t.string   "interests"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["care_group_id"], name: "index_seniors_on_care_group_id", using: :btree
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "senior_id"
    t.boolean  "pending"
    t.boolean  "approved"
    t.string   "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["senior_id"], name: "index_visits_on_senior_id", using: :btree
    t.index ["volunteer_id"], name: "index_visits_on_volunteer_id", using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "about"
    t.string   "location"
    t.string   "contact"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
