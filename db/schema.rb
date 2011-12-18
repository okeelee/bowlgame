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

ActiveRecord::Schema.define(:version => 20111218012450) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "bowl_game_teams", :force => true do |t|
    t.integer  "bowl_game_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bowl_games", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.datetime "game_time"
    t.string   "network"
    t.integer  "pickem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winner_id"
  end

  create_table "conferences", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "espn_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickems", :force => true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picks", :force => true do |t|
    t.integer  "bowl_game_id"
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pickem_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "disallow_comments"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "nick_name"
    t.string   "school_name"
    t.integer  "conference_id"
    t.integer  "espn_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
    t.float    "division_win_percent"
    t.float    "home_win_percent"
    t.float    "conference_win_percent"
    t.float    "road_win_percent"
    t.float    "win_percent"
    t.float    "avg_points_against"
    t.float    "avg_points_for"
    t.integer  "clincher"
    t.integer  "division_losses"
    t.integer  "division_ties"
    t.integer  "division_wins"
    t.float    "games_behind"
    t.integer  "games_played"
    t.integer  "home_losses"
    t.integer  "home_ties"
    t.integer  "home_wins"
    t.integer  "conference_losses"
    t.integer  "conference_ties"
    t.integer  "conference_wins"
    t.integer  "losses"
    t.integer  "ot_losses"
    t.integer  "ot_ties"
    t.integer  "ot_wins"
    t.integer  "playoff_seed"
    t.float    "points"
    t.integer  "points_against"
    t.integer  "points_for"
    t.integer  "road_losses"
    t.integer  "road_ties"
    t.integer  "road_wins"
    t.integer  "streak"
    t.integer  "ties"
    t.integer  "wins"
  end

  create_table "user_comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "user_comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "user_comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "username"
    t.boolean  "paid"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "score",                                 :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
