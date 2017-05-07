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

ActiveRecord::Schema.define(version: 20170430202013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "oyster_reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "oyster_quality"
    t.string   "shucking_quality"
    t.string   "presentation"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "oyster_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "oysters", force: :cascade do |t|
    t.string   "oyster_type"
    t.text     "description"
    t.string   "location"
    t.string   "salinity"
    t.string   "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer  "yelp_id"
    t.string   "name"
    t.string   "address"
    t.string   "hours"
    t.string   "menu"
    t.string   "specials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "website"
    t.text     "about"
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "dob"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
