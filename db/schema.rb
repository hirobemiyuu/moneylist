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

ActiveRecord::Schema.define(version: 2019_06_25_072517) do

  create_table "coments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.bigint "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "userid"
    t.string "user_name"
    t.string "image"
    t.index ["title_id"], name: "index_coments_on_title_id"
  end

  create_table "image_uploaders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "title_id"
    t.integer "day"
    t.string "place"
    t.string "name"
    t.integer "price"
    t.string "tag_1"
    t.string "tag_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "userid"
    t.index ["title_id"], name: "index_items_on_title_id"
  end

  create_table "sharings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_sharings_on_title_id"
    t.index ["user_id"], name: "index_sharings_on_user_id"
  end

  create_table "titles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "coment"
    t.text "member_ids"
    t.text "member"
    t.text "memberids"
    t.text "members"
    t.integer "m"
    t.index ["user_id"], name: "index_titles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "coments", "titles"
  add_foreign_key "items", "titles"
  add_foreign_key "sharings", "titles"
  add_foreign_key "sharings", "users"
  add_foreign_key "titles", "users"
end
