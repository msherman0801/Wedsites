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

ActiveRecord::Schema.define(version: 2019_04_26_153359) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "contents", force: :cascade do |t|
    t.text "spouse_one", default: "Spouse One"
    t.text "spouse_two", default: "Spouse Two"
    t.text "about_us", default: "About Us"
    t.text "summary", default: "Summary"
    t.datetime "date"
    t.text "location", default: "Location"
    t.text "contact_name", default: "Contact Name"
    t.text "contact_number", default: "(111) 222-3333"
    t.text "registry_name", default: "Registry Name"
    t.string "registry_url", default: "Registry URL"
    t.integer "website_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.text "title"
    t.string "description"
    t.datetime "date"
    t.string "location"
    t.string "attire"
    t.integer "website_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.datetime "date_responded"
    t.boolean "attending"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "guests"
    t.text "allergies"
    t.integer "website_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "image"
    t.string "uid"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "websites", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.integer "user_id"
    t.string "image"
    t.string "event_id"
    t.string "invitation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
