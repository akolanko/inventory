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

ActiveRecord::Schema.define(version: 20140504161326) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "website"
    t.datetime "posted_date"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "location"
    t.datetime "return_date"
    t.string   "contact_name"
    t.string   "contact_email"
    t.integer  "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.text     "measurements"
    t.integer  "price"
    t.integer  "inventory"
    t.boolean  "soldout"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "material"
  end

  create_table "sales", force: true do |t|
    t.integer  "price"
    t.string   "through"
    t.datetime "date"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipping_cost"
    t.integer  "shipping_paid"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
