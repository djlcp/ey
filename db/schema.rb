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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 0) do
=======
ActiveRecord::Schema.define(version: 2018_10_24_192838) do

  create_table "requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "manager_approval"
    t.boolean "counsellor_approval"
  end

  create_table "time_allocations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> 75c1830212a306c9f6e5c69a367775070b2f5c8b

end
