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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_072019) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "dec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "due_date", default: "2024-01-01 00:00:00"
    t.datetime "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "not returned"
    t.string "desc"
    t.string "checksum"
    t.string "token"
    t.index ["book_id"], name: "index_book_users_on_book_id"
    t.index ["user_id"], name: "index_book_users_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.integer "year"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "histories", force: :cascade do |t|
    t.string "source"
    t.string "payment_status"
    t.string "payment_method"
    t.string "payment_mode"
    t.string "fpx_model"
    t.float "transaction_fee"
    t.string "currency"
    t.string "fpx_debit_auth_code"
    t.float "transaction_amount"
    t.float "transaction_amount_received"
    t.integer "book_user_id"
    t.string "merchant_reference_number"
    t.string "exchange_number"
    t.string "buyer_name"
    t.string "buyer_phone"
    t.string "buyer_email"
    t.string "payment_id"
    t.string "client_ip"
    t.string "status_url"
    t.string "retry_url"
    t.string "receipt_url"
    t.string "params"
    t.string "checksum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_user_id"], name: "index_histories_on_book_user_id", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.integer "book_user_id", null: false
    t.boolean "status", default: false
    t.integer "user_id"
    t.string "buyer_name"
    t.string "buyer_email"
    t.string "buyer_phone"
    t.float "transaction_amount", default: 2.0
    t.string "product_description"
    t.string "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_user_id"], name: "index_payments_on_book_user_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "book_users", "books"
  add_foreign_key "book_users", "users"
  add_foreign_key "books", "authors"
  add_foreign_key "histories", "book_users"
  add_foreign_key "payments", "book_users"
  add_foreign_key "payments", "users"
end
