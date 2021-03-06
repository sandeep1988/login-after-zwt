# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150803071529) do

  create_table "cases", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "v_contact_id",       limit: 4
    t.integer  "v_sales_person_id",  limit: 4
    t.string   "v_title",            limit: 255
    t.string   "v_desc",             limit: 255
    t.string   "v_reference_urls",   limit: 255
    t.string   "v_file_attachments", limit: 255
    t.string   "v_tags",             limit: 255
    t.string   "v_note",             limit: 255
    t.string   "e_status",           limit: 255
    t.string   "filename",           limit: 255
    t.string   "content_type",       limit: 255
    t.binary   "file_contents",      limit: 65535
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name",           limit: 255
    t.string   "last_name",            limit: 255
    t.string   "email",                limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "user_id",              limit: 4
    t.string   "v_company_name",       limit: 255
    t.string   "v_im_skype",           limit: 255
    t.string   "v_website_url",        limit: 255
    t.string   "v_linkedin_url",       limit: 255
    t.string   "v_phone",              limit: 255
    t.string   "v_cell_number",        limit: 255
    t.string   "v_tags",               limit: 255
    t.string   "i_reffered_source_id", limit: 255
    t.boolean  "e_status",             limit: 1,   default: false
    t.string   "v_country",            limit: 255
    t.boolean  "v_contact_type",       limit: 1,   default: true
  end

  create_table "followuptypes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "v_title",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "e_status",               limit: 1,   default: true
    t.string   "v_firstname",            limit: 255
    t.string   "v_lastname",             limit: 255
    t.string   "v_im_skype",             limit: 255
    t.string   "v_im_password",          limit: 255
    t.string   "v_gmail",                limit: 255
    t.string   "v_linkedin_url",         limit: 255
    t.string   "v_phone",                limit: 255
    t.boolean  "e_type",                 limit: 1,   default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
