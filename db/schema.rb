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

ActiveRecord::Schema.define(version: 20141210224551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "descriptions", force: true do |t|
    t.text     "body"
    t.integer  "input_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "descriptions", ["input_id"], name: "index_descriptions_on_input_id", using: :btree
  add_index "descriptions", ["user_id"], name: "index_descriptions_on_user_id", using: :btree

  create_table "flags", force: true do |t|
    t.integer  "user_id"
    t.integer  "input_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["input_id"], name: "index_flags_on_input_id", using: :btree
  add_index "flags", ["user_id"], name: "index_flags_on_user_id", using: :btree

  create_table "inputs", force: true do |t|
    t.text     "type"
    t.integer  "user_id"
    t.integer  "mountain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inputs", ["mountain_id"], name: "index_inputs_on_mountain_id", using: :btree
  add_index "inputs", ["user_id"], name: "index_inputs_on_user_id", using: :btree

  create_table "mountains", force: true do |t|
    t.text     "name"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "input_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["input_id"], name: "index_ratings_on_input_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "username",        null: false
    t.text     "email",           null: false
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
