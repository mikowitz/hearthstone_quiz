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

ActiveRecord::Schema.define(version: 20140830221912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "card_type"
    t.integer  "rarity"
    t.integer  "faction"
    t.integer  "race"
    t.integer  "player_class"
    t.text     "text"
    t.string   "mechanic_ids",   default: [], array: true
    t.integer  "attack"
    t.integer  "health"
    t.integer  "durability"
    t.string   "hearthstone_id"
    t.boolean  "collectible"
    t.boolean  "elite"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mechanics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
