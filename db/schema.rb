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

ActiveRecord::Schema[7.1].define(version: 2024_11_19_093241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodation_amenities", force: :cascade do |t|
    t.bigint "amenity_id", null: false
    t.bigint "accommodation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_accommodation_amenities_on_accommodation_id"
    t.index ["amenity_id"], name: "index_accommodation_amenities_on_amenity_id"
  end

  create_table "accommodations", force: :cascade do |t|
    t.string "type_of_place"
    t.integer "price"
    t.integer "rating"
    t.string "address"
    t.integer "bed_count"
    t.integer "bedroom_count"
    t.integer "bathroom_count"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "guest_count"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "accommodation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_bookings_on_accommodation_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "accommodation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_reviews_on_accommodation_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accommodation_amenities", "accommodations"
  add_foreign_key "accommodation_amenities", "amenities"
  add_foreign_key "accommodations", "users"
  add_foreign_key "bookings", "accommodations"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "accommodations"
  add_foreign_key "reviews", "users"
end
