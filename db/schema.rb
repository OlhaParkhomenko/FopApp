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

ActiveRecord::Schema.define(version: 20160528120830) do

  create_table "categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city_name"
  end

  add_index "cities", ["city_name"], name: "index_cities_on_city_name"

  create_table "people", force: :cascade do |t|
    t.string   "fullname"
    t.string   "address"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "surname"
    t.string   "name"
    t.string   "middle_name"
    t.string   "zip_code"
    t.string   "raw_address"
  end

  add_index "people", ["category_id"], name: "index_people_on_category_id"
  add_index "people", ["middle_name"], name: "index_people_on_middle_name"
  add_index "people", ["name"], name: "index_people_on_name"
  add_index "people", ["raw_address"], name: "index_people_on_raw_address"
  add_index "people", ["surname"], name: "index_people_on_surname"
  add_index "people", ["zip_code"], name: "index_people_on_zip_code"

  create_table "regions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "region_name"
  end

  add_index "regions", ["region_name"], name: "index_regions_on_region_name"

end
