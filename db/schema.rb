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

ActiveRecord::Schema.define(version: 20130520022102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_listings", force: true do |t|
    t.string   "title"
    t.integer  "provider_id"
    t.text     "description"
    t.text     "extra"
    t.string   "location_string"
    t.text     "url"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "provider_updated_at"
    t.string   "key_in_provider"
  end

  create_table "jobs", force: true do |t|
    t.string   "role"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
