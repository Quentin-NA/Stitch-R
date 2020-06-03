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

ActiveRecord::Schema.define(version: 2020_06_03_102910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forwards", force: :cascade do |t|
    t.bigint "receipt_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receipt_id"], name: "index_forwards_on_receipt_id"
    t.index ["receiver_id"], name: "index_forwards_on_receiver_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "gmail_id"
    t.bigint "supplier_search_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "from", null: false
    t.string "subject"
    t.string "snippet"
    t.datetime "send_date", null: false
    t.string "status", null: false
    t.bigint "user_id", null: false
    t.bigint "receiver_id"
    t.string "attachment_names", array: true
    t.index ["attachment_names"], name: "index_receipts_on_attachment_names", using: :gin
    t.index ["receiver_id"], name: "index_receipts_on_receiver_id"
    t.index ["supplier_search_id"], name: "index_receipts_on_supplier_search_id"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["user_id"], name: "index_receivers_on_user_id"
  end

  create_table "supplier_searches", force: :cascade do |t|
    t.string "from"
    t.string "keyword"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subject", default: ""
    t.string "contains", default: ""
    t.string "not_contains", default: ""
    t.date "start_date"
    t.date "end_date"
    t.string "label", default: ""
    t.boolean "attachment", default: false
    t.string "image"
    t.string "name"
    t.boolean "subscribe", default: true
  end

  create_table "supplier_searches_users", id: false, force: :cascade do |t|
    t.bigint "supplier_search_id", null: false
    t.bigint "user_id", null: false
    t.index ["supplier_search_id"], name: "index_supplier_searches_users_on_supplier_search_id"
    t.index ["user_id"], name: "index_supplier_searches_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "google_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.boolean "expires"
    t.string "refresh_token"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "forwards", "receipts"
  add_foreign_key "forwards", "receivers"
  add_foreign_key "receipts", "receivers"
  add_foreign_key "receipts", "supplier_searches"
  add_foreign_key "receipts", "users"
  add_foreign_key "receivers", "users"
end
