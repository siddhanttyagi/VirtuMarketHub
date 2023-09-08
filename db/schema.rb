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

ActiveRecord::Schema[7.0].define(version: 2023_09_08_053336) do
  create_table "items", force: :cascade do |t|
    t.integer "seller_id", null: false
    t.integer "shop_id", null: false
    t.string "item_name"
    t.integer "quantity"
    t.text "summary"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_items_on_seller_id"
    t.index ["shop_id"], name: "index_items_on_shop_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "seller_id", null: false
    t.integer "shop_id", null: false
    t.boolean "payment_check"
    t.text "order_details"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_orders_on_seller_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "sellername", null: false
    t.string "email", null: false
    t.string "password"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirm_password"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_name", null: false
    t.integer "seller_id", null: false
    t.text "shop_summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_shops_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password"
    t.string "address"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_confirmation"
  end

  add_foreign_key "items", "sellers"
  add_foreign_key "items", "shops"
  add_foreign_key "orders", "sellers"
  add_foreign_key "orders", "shops"
  add_foreign_key "orders", "users"
  add_foreign_key "shops", "sellers"
end
