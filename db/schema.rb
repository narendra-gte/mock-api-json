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

ActiveRecord::Schema.define(version: 20170825141255) do

  create_table "fine_prints", force: :cascade do |t|
    t.integer "product_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_fine_prints_on_product_id"
  end

  create_table "images_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "image_id"
    t.boolean "is_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_products_on_product_id"
  end

  create_table "images_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_images_tags_on_tag_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.text "name"
    t.integer "category_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "business_id"
    t.string "title"
    t.string "description"
    t.boolean "show_discount"
    t.boolean "gifting_enabled"
    t.boolean "sharing_enabled"
    t.boolean "mobile_call_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "product_type_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "products_target_customers", force: :cascade do |t|
    t.integer "product_id"
    t.integer "target_customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_target_customers_on_product_id"
    t.index ["target_customer_id"], name: "index_products_target_customers_on_target_customer_id"
  end

  create_table "purchase_options", force: :cascade do |t|
    t.integer "product_id"
    t.string "name"
    t.integer "redemption_qty"
    t.decimal "min_price"
    t.decimal "retail_price"
    t.integer "max_per_person"
    t.integer "quantity_available"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchase_options_on_product_id"
  end

  create_table "tag_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer "tag_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_category_id"], name: "index_tags_on_tag_category_id"
  end

  create_table "target_customers", force: :cascade do |t|
    t.string "gender"
    t.integer "min_age"
    t.integer "max_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
