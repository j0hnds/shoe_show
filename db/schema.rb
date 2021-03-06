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

ActiveRecord::Schema.define(:version => 20121116032145) do

  create_table "associates", :force => true do |t|
    t.integer  "room_id",                  :null => false
    t.string   "first_name", :limit => 40
    t.string   "last_name",  :limit => 40
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "attendances", :force => true do |t|
    t.integer  "show_id",    :null => false
    t.integer  "buyer_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "buyers", :force => true do |t|
    t.string   "first_name",      :limit => 40
    t.string   "last_name",       :limit => 40
    t.integer  "contact_info_id",               :null => false
    t.integer  "store_id",                      :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "contact_infos", :force => true do |t|
    t.string   "address_1",   :limit => 60
    t.string   "address_2",   :limit => 60
    t.string   "city",        :limit => 60
    t.string   "state",       :limit => 2
    t.string   "postal_code", :limit => 10
    t.string   "email",       :limit => 80
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "coordinators", :force => true do |t|
    t.string   "first_name",      :limit => 40
    t.string   "last_name",       :limit => 40
    t.integer  "contact_info_id",               :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "exhibitors", :force => true do |t|
    t.string   "first_name",      :limit => 40
    t.string   "last_name",       :limit => 40
    t.integer  "contact_info_id",               :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "lines", :force => true do |t|
    t.integer  "room_id",                  :null => false
    t.integer  "order",                    :null => false
    t.string   "line",       :limit => 80, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "phones", :force => true do |t|
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.string   "phone_type",     :limit => 10
    t.string   "phone_number",   :limit => 15
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "show_id",      :null => false
    t.integer  "exhibitor_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rooms", :force => true do |t|
    t.integer  "registration_id",               :null => false
    t.string   "room",            :limit => 10
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "name",            :limit => 40
    t.date     "start_date"
    t.date     "end_date"
    t.date     "next_start_date"
    t.date     "next_end_date"
    t.integer  "coordinator_id",                :null => false
    t.integer  "venue_id",                      :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.integer  "contact_info_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "name",            :limit => 40
    t.integer  "contact_info_id",               :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
