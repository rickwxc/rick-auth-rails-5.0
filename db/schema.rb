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

ActiveRecord::Schema.define(version: 20170210042742) do

  create_table "auth_addrs", force: :cascade do |t|
    t.string   "street_number"
    t.string   "street"
    t.integer  "auth_sb_id"
    t.text     "org"
    t.text     "raw_json"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "unit_no"
  end

  create_table "auth_bundle2objs", force: :cascade do |t|
    t.integer  "auth_bundle_id"
    t.integer  "auth_obj_id"
    t.string   "auth_obj_model_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "auth_bundles", force: :cascade do |t|
    t.string   "auth_name"
    t.decimal  "auth_total", precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "auth_carts", force: :cascade do |t|
    t.integer  "auth_user_id"
    t.string   "auth_visitor_uuid"
    t.integer  "auth_obj_id"
    t.string   "auth_obj_model_name"
    t.decimal  "auth_obj_qty",        precision: 10, scale: 2
    t.text     "auth_obj_meta_json"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "auth_gjs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_invoices", force: :cascade do |t|
    t.string   "uuid"
    t.decimal  "gross",             precision: 10, scale: 2
    t.decimal  "fee",               precision: 10, scale: 2
    t.integer  "auth_order_id"
    t.integer  "auth_paymethod_id"
    t.integer  "auth_invoicest_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "auth_invoicests", force: :cascade do |t|
    t.string   "auth_st"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_objs", force: :cascade do |t|
    t.string   "auth_name"
    t.string   "auth_uuid"
    t.text     "auth_descr"
    t.decimal  "auth_unitprice",   precision: 10, scale: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "auth_is_disabled"
  end

  create_table "auth_order2objs", force: :cascade do |t|
    t.integer  "auth_order_id"
    t.decimal  "auth_total",            precision: 10, scale: 2
    t.decimal  "auth_gst",              precision: 10, scale: 2
    t.integer  "auth_obj_id"
    t.string   "auth_obj_model_name"
    t.string   "auth_obj_display_name"
    t.decimal  "auth_obj_qty",          precision: 10, scale: 2
    t.decimal  "auth_obj_unitprice",    precision: 10, scale: 2
    t.text     "auth_obj_meta_json"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "auth_orders", force: :cascade do |t|
    t.integer  "auth_user_id"
    t.string   "auth_visitor_uuid"
    t.decimal  "auth_total",        precision: 10, scale: 2
    t.decimal  "auth_gst",          precision: 10, scale: 2
    t.integer  "auth_orderst_id"
    t.integer  "auth_payst_id"
    t.text     "auth_note"
    t.text     "auth_meta_json"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "shipping_addr_id"
    t.integer  "billing_addr_id"
  end

  create_table "auth_ordersts", force: :cascade do |t|
    t.string   "auth_st"
    t.text     "auth_descr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_paymethods", force: :cascade do |t|
    t.string   "auth_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_paysts", force: :cascade do |t|
    t.string   "auth_st"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_reasons", force: :cascade do |t|
    t.string   "long"
    t.string   "short"
    t.string   "descr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_reasonsts", force: :cascade do |t|
    t.string   "st"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_sbs", force: :cascade do |t|
    t.string   "name"
    t.string   "zip"
    t.integer  "auth_st_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_sts", force: :cascade do |t|
    t.string   "name"
    t.integer  "auth_gj_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_support_tickets", force: :cascade do |t|
    t.string   "email"
    t.string   "mobile"
    t.integer  "user_id"
    t.text     "note"
    t.text     "meta"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "auth_reasonst_id"
    t.integer  "auth_reason_id"
  end

  create_table "auth_user_addr_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_user_addrs", force: :cascade do |t|
    t.integer  "auth_user_id"
    t.string   "auth_visitor_uuid"
    t.integer  "auth_user_addr_type_id"
    t.integer  "auth_addr_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mobile"
    t.string   "company"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "imgs", force: :cascade do |t|
    t.string   "modelname"
    t.integer  "uuid"
    t.integer  "idx"
    t.string   "alt"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "controllername"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "position2permissions", force: :cascade do |t|
    t.integer  "position_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "controllername"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "ums", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ums_on_user_id"
  end

  create_table "user2positions", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
