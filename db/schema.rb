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

ActiveRecord::Schema.define(version: 20170804004557) do

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

  create_table "auth_bundle_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_bundles", force: :cascade do |t|
    t.string   "auth_name"
    t.decimal  "auth_total",          precision: 10, scale: 2
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "auth_bundle_type_id"
    t.text     "descr"
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

  create_table "auth_coupons", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.decimal  "val",        precision: 10, scale: 2
    t.date     "expire_at"
    t.boolean  "is_enabled"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "auth_gjs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_imggroup_types", force: :cascade do |t|
    t.string   "name"
    t.string   "acckey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_imggroups", force: :cascade do |t|
    t.string   "name"
    t.integer  "auth_imggroup_type_id"
    t.integer  "maximg"
    t.integer  "obj_id"
    t.string   "model"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
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

  create_table "auth_obj_attr_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_obj_attr_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "auth_obj_attr_group_id"
    t.integer  "idx"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "show_name"
    t.boolean  "is_show"
  end

  create_table "auth_obj_attrs", force: :cascade do |t|
    t.string   "model"
    t.integer  "obj_id"
    t.integer  "auth_obj_attr_type_id"
    t.string   "value"
    t.integer  "idx"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "auth_objs", force: :cascade do |t|
    t.string   "auth_name"
    t.string   "auth_uuid"
    t.text     "auth_descr"
    t.decimal  "auth_unitprice",   precision: 10, scale: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "auth_is_disabled"
    t.integer  "stock_qty"
    t.string   "barcode"
    t.date     "in_stock_date"
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
    t.decimal  "auth_shipping_cost",    precision: 10, scale: 2
    t.string   "uuid"
    t.string   "barcode"
  end

  create_table "auth_order_shipping_rules", force: :cascade do |t|
    t.text     "name"
    t.decimal  "cost",       precision: 10, scale: 2
    t.decimal  "order_amt",  precision: 10, scale: 2
    t.boolean  "is_enabled"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "auth_orders", force: :cascade do |t|
    t.integer  "auth_user_id"
    t.string   "auth_visitor_uuid"
    t.decimal  "auth_total",         precision: 10, scale: 2
    t.decimal  "auth_gst",           precision: 10, scale: 2
    t.integer  "auth_orderst_id"
    t.integer  "auth_payst_id"
    t.text     "auth_note"
    t.text     "auth_meta_json"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "shipping_addr_id"
    t.integer  "billing_addr_id"
    t.decimal  "auth_shipping_cost", precision: 10, scale: 2
    t.decimal  "auth_total_org",     precision: 10, scale: 2
    t.integer  "auth_coupon_id"
    t.decimal  "auth_coupon_amt",    precision: 10, scale: 2
    t.integer  "src_user_id"
  end

  create_table "auth_ordersts", force: :cascade do |t|
    t.string   "auth_st"
    t.text     "auth_descr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "user_todo"
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

  create_table "auth_sbs", force: :cascade do |t|
    t.string   "name"
    t.string   "zip"
    t.integer  "auth_st_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_sel_shippingrules", force: :cascade do |t|
    t.string   "name"
    t.decimal  "cost",       precision: 10, scale: 2
    t.integer  "idx"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "auth_shippingrule2objs", force: :cascade do |t|
    t.string   "model"
    t.integer  "auth_sel_shippingrule_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "auth_sts", force: :cascade do |t|
    t.string   "name"
    t.integer  "auth_gj_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_tag2objs", force: :cascade do |t|
    t.string   "model"
    t.integer  "auth_obj_id"
    t.integer  "auth_tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "auth_tag2tags", force: :cascade do |t|
    t.integer  "ptag_id"
    t.integer  "ctag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_tagtypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean  "can_pickup"
    t.boolean  "is_not_used"
  end

  create_table "auth_website2tags", force: :cascade do |t|
    t.integer  "auth_website_id"
    t.integer  "auth_tag_id"
    t.integer  "idx"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "auth_websites", force: :cascade do |t|
    t.string   "url"
    t.string   "sendfromemail"
    t.string   "replyemail"
    t.string   "shortname"
    t.string   "title"
    t.text     "descr"
    t.string   "mailapikey"
    t.string   "mailapiurl"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.text     "click_url"
    t.text     "caption"
    t.text     "descr"
    t.index ["modelname"], name: "index_imgs_on_modelname"
    t.index ["uuid"], name: "index_imgs_on_uuid"
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
    t.boolean  "admin"
    t.integer  "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
