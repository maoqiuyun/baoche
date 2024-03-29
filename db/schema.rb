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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111128150758) do

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_activities", :force => true do |t|
    t.integer  "order_id"
    t.string   "before_change"
    t.string   "after_change"
    t.string   "attr_name"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "tour_id"
    t.integer  "location_id"
    t.integer  "user_id"
    t.integer  "num"
    t.integer  "status",         :default => 0
    t.date     "departure_date"
    t.string   "link_name"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
  end

  create_table "tours", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "password"
    t.integer  "roles_mask", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
