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

ActiveRecord::Schema.define(version: 20170810130431) do

  create_table "colors", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fixed_costs", force: :cascade do |t|
    t.string   "name"
    t.string   "descripcion"
    t.float    "amount"
    t.datetime "valid_from"
    t.datetime "valid_until"
    t.string   "payment_code"
    t.string   "supplier"
    t.string   "service_code"
    t.integer  "currency_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "product_colors", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_providers", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "provider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "family_id"
    t.float    "price"
    t.integer  "tax_ids"
    t.integer  "color_id"
    t.integer  "stock_disponible"
    t.integer  "stock_reservado"
    t.integer  "stock_pedido"
    t.integer  "stock_fisico"
    t.boolean  "descuento"
    t.boolean  "activo"
    t.integer  "packaging_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image"
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "nif"
    t.string   "email"
    t.string   "tel"
    t.string   "address"
    t.string   "contact_name"
    t.string   "country"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_adresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "street"
    t.string   "second_street"
    t.string   "zip"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "floor"
    t.string   "stairs"
    t.string   "door"
    t.string   "building"
    t.string   "other"
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_cart_products", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_products", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "guest",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "superadmin_role",        default: false
    t.boolean  "salesman_role",          default: false
    t.boolean  "user_role",              default: true
    t.string   "password"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_hash"
    t.string   "password_halt"
    t.string   "name"
    t.string   "lastname"
    t.string   "dni"
    t.date     "birth"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
