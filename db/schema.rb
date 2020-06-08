# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_08_185410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "amenities_listings", id: false, force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "amenity_id"
    t.index ["amenity_id"], name: "index_amenities_listings_on_amenity_id"
    t.index ["listing_id"], name: "index_amenities_listings_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.integer "bathrooms"
    t.integer "beds"
    t.integer "guests"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "type_id", null: false
    t.index ["type_id"], name: "index_listings_on_type_id"
  end

  create_table "listings_spaces", id: false, force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "space_id"
    t.index ["listing_id"], name: "index_listings_spaces_on_listing_id"
    t.index ["space_id"], name: "index_listings_spaces_on_space_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "country_code"
    t.string "city"
    t.integer "postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
    t.string "country"
    t.bigint "listing_id", null: false
    t.string "street_address"
    t.index ["listing_id"], name: "index_locations_on_listing_id", unique: true
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "listings", "types"
  add_foreign_key "locations", "listings"
end
