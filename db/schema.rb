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

ActiveRecord::Schema.define(version: 20130921215624) do

  create_table "matchplays", force: true do |t|
    t.integer  "player_id"
    t.integer  "matchup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matchups", force: true do |t|
    t.integer  "player_1"
    t.integer  "player_2"
    t.integer  "pts_player_1_week_1"
    t.integer  "pts_player_1_week_2"
    t.integer  "pts_player_1_week_3"
    t.integer  "pts_player_1_week_4"
    t.integer  "pts_player_1_week_5"
    t.integer  "pts_player_1_week_6"
    t.integer  "pts_player_1_week_7"
    t.integer  "pts_player_1_week_8"
    t.integer  "pts_player_1_week_9"
    t.integer  "pts_player_1_week_10"
    t.integer  "pts_player_1_week_11"
    t.integer  "pts_player_1_week_12"
    t.integer  "pts_player_1_week_13"
    t.integer  "pts_player_1_week_14"
    t.integer  "pts_player_1_week_15"
    t.integer  "pts_player_1_week_16"
    t.integer  "pts_player_1_week_17"
    t.integer  "pts_player_2_week_1"
    t.integer  "pts_player_2_week_2"
    t.integer  "pts_player_2_week_3"
    t.integer  "pts_player_2_week_4"
    t.integer  "pts_player_2_week_5"
    t.integer  "pts_player_2_week_6"
    t.integer  "pts_player_2_week_7"
    t.integer  "pts_player_2_week_8"
    t.integer  "pts_player_2_week_9"
    t.integer  "pts_player_2_week_10"
    t.integer  "pts_player_2_week_11"
    t.integer  "pts_player_2_week_12"
    t.integer  "pts_player_2_week_13"
    t.integer  "pts_player_2_week_14"
    t.integer  "pts_player_2_week_15"
    t.integer  "pts_player_2_week_16"
    t.integer  "pts_player_2_week_17"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "players", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "position"
    t.decimal  "pts_week_1"
    t.decimal  "pts_week_2"
    t.decimal  "pts_week_3"
    t.decimal  "pts_week_4"
    t.decimal  "pts_week_5"
    t.decimal  "pts_week_6"
    t.decimal  "pts_week_7"
    t.decimal  "pts_week_8"
    t.decimal  "pts_week_9"
    t.decimal  "pts_week_10"
    t.decimal  "pts_week_11"
    t.decimal  "pts_week_12"
    t.decimal  "pts_week_13"
    t.decimal  "pts_week_14"
    t.decimal  "pts_week_15"
    t.decimal  "pts_week_16"
    t.decimal  "pts_week_17"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.string   "image_name"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "opp_week_1"
    t.integer  "opp_week_2"
    t.integer  "opp_week_3"
    t.integer  "opp_week_4"
    t.integer  "opp_week_5"
    t.integer  "opp_week_6"
    t.integer  "opp_week_7"
    t.integer  "opp_week_8"
    t.integer  "opp_week_9"
    t.integer  "opp_week_10"
    t.integer  "opp_week_11"
    t.integer  "opp_week_12"
    t.integer  "opp_week_13"
    t.integer  "opp_week_14"
    t.integer  "opp_week_15"
    t.integer  "opp_week_16"
    t.integer  "opp_week_17"
    t.boolean  "home_week_1"
    t.boolean  "home_week_2"
    t.boolean  "home_week_3"
    t.boolean  "home_week_4"
    t.boolean  "home_week_5"
    t.boolean  "home_week_6"
    t.boolean  "home_week_7"
    t.boolean  "home_week_8"
    t.boolean  "home_week_9"
    t.boolean  "home_week_10"
    t.boolean  "home_week_11"
    t.boolean  "home_week_12"
    t.boolean  "home_week_13"
    t.boolean  "home_week_14"
    t.boolean  "home_week_15"
    t.boolean  "home_week_16"
    t.boolean  "home_week_17"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
