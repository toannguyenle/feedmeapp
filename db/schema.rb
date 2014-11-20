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

ActiveRecord::Schema.define(version: 20141118031733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: true do |t|
    t.string   "delivery_method"
    t.string   "delivered_by"
    t.string   "estimated_delivery_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "deliveries", ["order_id"], name: "index_deliveries_on_order_id", using: :btree

  create_table "details", force: true do |t|
    t.string   "status"
    t.string   "additional_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "details", ["order_id"], name: "index_details_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "product_count"
    t.integer  "processing_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_id"
    t.integer  "detail_id"
    t.integer  "delivery_id"
  end

  add_index "orders", ["delivery_id"], name: "index_orders_on_delivery_id", using: :btree
  add_index "orders", ["detail_id"], name: "index_orders_on_detail_id", using: :btree
  add_index "orders", ["payment_id"], name: "index_orders_on_payment_id", using: :btree

  create_table "payments", force: true do |t|
    t.string   "payment_method"
    t.string   "amount"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "products", ["order_id"], name: "index_products_on_order_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "phone_number"
    t.string   "address"
    t.string   "yelp_id"
    t.string   "image_url"
    t.string   "categories"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lat"
    t.string   "lng"
    t.integer  "order_id"
  end

  add_index "restaurants", ["order_id"], name: "index_restaurants_on_order_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "users", ["order_id"], name: "index_users_on_order_id", using: :btree

end
