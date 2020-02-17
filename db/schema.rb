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

ActiveRecord::Schema.define(version: 2020_02_17_143722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.bigint "vinyl_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vinyl_id"], name: "index_artists_on_vinyl_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_rent"
    t.date "end_rent"
    t.bigint "user_id"
    t.bigint "vinyl_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["vinyl_id"], name: "index_bookings_on_vinyl_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.bigint "vinyl_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vinyl_id"], name: "index_genres_on_vinyl_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.bigint "vinyl_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vinyl_id"], name: "index_tracks_on_vinyl_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vinyls", force: :cascade do |t|
    t.string "name"
    t.date "relase_date"
    t.float "price_per_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "artists", "vinyls"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "vinyls"
  add_foreign_key "genres", "vinyls"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "tracks", "vinyls"
end
