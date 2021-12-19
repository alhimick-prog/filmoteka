# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_19_171739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "commentable_id"
    t.string "commentable_type"
    t.bigint "user_id", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "banner", default: "🏳️", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "film_categories", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_film_categories_on_category_id"
    t.index ["film_id"], name: "index_film_categories_on_film_id"
  end

  create_table "film_countries", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_film_countries_on_country_id"
    t.index ["film_id"], name: "index_film_countries_on_film_id"
  end

  create_table "film_genres", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_film_genres_on_film_id"
    t.index ["genre_id"], name: "index_film_genres_on_genre_id"
  end

  create_table "film_people", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "person_id", null: false
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_film_people_on_film_id"
    t.index ["person_id"], name: "index_film_people_on_person_id"
  end

  create_table "film_tags", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_film_tags_on_film_id"
    t.index ["tag_id"], name: "index_film_tags_on_tag_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.text "trailer_url"
    t.datetime "release_date", default: "1895-01-01 00:00:00", null: false
    t.integer "duration", null: false
    t.integer "age_restriction", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_films_on_creator_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_genres_on_name"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.datetime "death_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "release_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_seasons_on_film_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.string "nickname"
    t.datetime "birthday", default: "1970-01-01 00:00:00", null: false
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watch_items", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "user_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_watch_items_on_film_id"
    t.index ["status"], name: "index_watch_items_on_status"
    t.index ["user_id"], name: "index_watch_items_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "episodes", "seasons"
  add_foreign_key "film_categories", "categories"
  add_foreign_key "film_categories", "films"
  add_foreign_key "film_countries", "countries"
  add_foreign_key "film_countries", "films"
  add_foreign_key "film_genres", "films"
  add_foreign_key "film_genres", "genres"
  add_foreign_key "film_people", "films"
  add_foreign_key "film_people", "people"
  add_foreign_key "film_tags", "films"
  add_foreign_key "film_tags", "tags"
  add_foreign_key "films", "users", column: "creator_id"
  add_foreign_key "seasons", "films"
  add_foreign_key "watch_items", "films"
  add_foreign_key "watch_items", "users"
end
