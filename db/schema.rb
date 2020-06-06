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

ActiveRecord::Schema.define(version: 2020_06_03_020457) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.integer "month_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["month_id"], name: "index_categories_on_month_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "planned_cents", default: 0, null: false
    t.string "planned_currency", default: "USD", null: false
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.integer "month_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["month_id"], name: "index_items_on_month_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "month"
    t.integer "year"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_months_on_user_id"
  end

  create_table "paychecks", force: :cascade do |t|
    t.string "name"
    t.integer "payday_cents", default: 0, null: false
    t.string "payday_currency", default: "USD", null: false
    t.datetime "payday_date"
    t.integer "user_id", null: false
    t.integer "month_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["month_id"], name: "index_paychecks_on_month_id"
    t.index ["user_id"], name: "index_paychecks_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.integer "month_id", null: false
    t.integer "spent_cents", default: 0, null: false
    t.string "spent_currency", default: "USD", null: false
    t.datetime "spent_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_transactions_on_item_id"
    t.index ["month_id"], name: "index_transactions_on_month_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
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

  add_foreign_key "categories", "months"
  add_foreign_key "categories", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "months"
  add_foreign_key "items", "users"
  add_foreign_key "paychecks", "months"
  add_foreign_key "paychecks", "users"
  add_foreign_key "transactions", "items"
  add_foreign_key "transactions", "months"
  add_foreign_key "transactions", "users"
end
