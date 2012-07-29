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

ActiveRecord::Schema.define(:version => 20120729175021) do

  create_table "patients", :force => true do |t|
    t.string   "surname"
    t.string   "firstname"
    t.date     "dob"
    t.string   "mrn"
    t.string   "diagnosis"
    t.text     "pmhx"
    t.text     "rx"
    t.text     "vitals"
    t.text     "exam"
    t.text     "ekg"
    t.text     "echo"
    t.text     "cath"
    t.text     "other"
    t.text     "summary"
    t.text     "decisions"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "patients", ["mrn", "created_at", "surname"], :name => "index_patients_on_mrn_and_created_at_and_surname"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "title"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "editor",          :default => false
    t.boolean  "viewer",          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
