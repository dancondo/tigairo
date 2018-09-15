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

ActiveRecord::Schema.define(version: 2018_09_15_144252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment_target_name"
    t.string "comment_target_type"
    t.bigint "comment_target_id"
    t.index ["comment_target_type", "comment_target_id"], name: "index_comments_on_comment_target_type_and_comment_target_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "photo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.bigint "category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "photo"
    t.bigint "country_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["country_id"], name: "index_posts_on_country_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reaction_tags", force: :cascade do |t|
    t.string "name"
    t.string "photo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.string "reaction_target_name"
    t.string "reaction_target_type"
    t.bigint "reaction_target_id"
    t.bigint "reaction_tag_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reaction_tag_id"], name: "index_reactions_on_reaction_tag_id"
    t.index ["reaction_target_type", "reaction_target_id"], name: "index_reactions_on_reaction_target_type_and_reaction_target_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "user_countries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_user_countries_on_country_id"
    t.index ["user_id"], name: "index_user_countries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "nickname"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "countries"
  add_foreign_key "posts", "users"
  add_foreign_key "reactions", "reaction_tags"
  add_foreign_key "reactions", "users"
  add_foreign_key "user_countries", "countries"
  add_foreign_key "user_countries", "users"
end
