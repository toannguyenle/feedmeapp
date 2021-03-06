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

ActiveRecord::Schema.define(version: 20141201205356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.integer  "price"
    t.string   "additional_info"
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "payment_type"
    t.integer  "processing_time"
    t.string   "status"
    t.string   "delivery_option"
    t.string   "delivered_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "orders", ["user_id"], name: "index_order_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "categories"
    t.string   "description"
    t.string   "image_urls"
    t.float    "regular_price"
    t.float    "discount_price"
    t.time     "discount_start_time"
    t.time     "discount_end_time"
    t.integer  "discount_inventory"
    t.string   "ordr"
    t.string   "delivery_method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
  end

  add_index "products", ["restaurant_id"], name: "index_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "phone_number"
    t.string   "street_address_1"
    t.string   "yelp_id"
    t.string   "image_url"
    t.string   "categories"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
  end

  add_index "restaurants", ["user_id"], name: "index_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone_number"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_business"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.string   "street_address_1"
    t.string   "street_address_2"
  end

end
