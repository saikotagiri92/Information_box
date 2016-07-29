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

ActiveRecord::Schema.define(version: 20160416061129) do

  create_table "application_bugs", force: :cascade do |t|
    t.integer  "bug_raised_by",            limit: 8
    t.text     "bug_details",              limit: 65535
    t.string   "bug_raised_from_ip",       limit: 255
    t.string   "bug_raised_from_platform", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",           limit: 255,        null: false
    t.integer  "author_id",       limit: 8,          null: false
    t.text     "content",         limit: 4294967295
    t.integer  "last_updated_by", limit: 8
    t.integer  "parent_id",       limit: 8
    t.integer  "box_id",          limit: 8,          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry",        limit: 255
  end

  create_table "boxes", force: :cascade do |t|
    t.integer  "organisation_id", limit: 8,   null: false
    t.string   "name",            limit: 255, null: false
    t.string   "description",     limit: 255
    t.integer  "created_by",      limit: 8
    t.integer  "last_updated_by", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boxes_users", force: :cascade do |t|
    t.integer "box_id",  limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id",      limit: 4,          null: false
    t.integer  "user_id",         limit: 8,          null: false
    t.text     "content",         limit: 4294967295
    t.datetime "deleted_on"
    t.integer  "last_updated_by", limit: 8
    t.integer  "parent_id",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "organisations", force: :cascade do |t|
    t.string   "name",            limit: 255,        null: false
    t.text     "description",     limit: 4294967295
    t.integer  "owner_id",        limit: 8,          null: false
    t.string   "address_line_1",  limit: 255
    t.string   "address_line_2",  limit: 255
    t.string   "city",            limit: 255
    t.string   "pin_code",        limit: 255
    t.string   "state",           limit: 255
    t.string   "country",         limit: 255
    t.string   "phone_number_1",  limit: 255
    t.string   "phone_number_2",  limit: 255
    t.string   "email_address_1", limit: 255
    t.string   "email_address_2", limit: 255
    t.string   "contact_person",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone",       limit: 255
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",                          limit: 255
    t.text     "description",                   limit: 65535
    t.integer  "organisation_id",               limit: 4
    t.boolean  "can_access_boxes_index"
    t.boolean  "can_access_boxes_new"
    t.boolean  "can_access_boxes_show"
    t.boolean  "can_access_boxes_edit"
    t.boolean  "can_access_boxes_destroy"
    t.boolean  "can_access_articles_new"
    t.boolean  "can_access_articles_edit"
    t.boolean  "can_access_articles_destroy"
    t.boolean  "can_access_comments_create"
    t.boolean  "can_access_comments_edit"
    t.boolean  "can_access_comments_destroy"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "can_access_boxes_assign_users"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                           limit: 255,                        null: false
    t.text     "bio",                            limit: 4294967295
    t.string   "designation",                    limit: 255
    t.string   "linkedin_profile_link",          limit: 255
    t.string   "facebook_profile_link",          limit: 255
    t.string   "twitter_profile_link",           limit: 255
    t.boolean  "admin",                                             default: false, null: false
    t.boolean  "active",                                            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_reset_from_ip_address", limit: 255
    t.integer  "organisation_id",                limit: 4
    t.string   "email",                          limit: 255,        default: "",    null: false
    t.string   "encrypted_password",             limit: 255,        default: "",    null: false
    t.string   "password_digest",                limit: 255
    t.string   "reset_password_token",           limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                  limit: 4,          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",             limit: 255
    t.string   "last_sign_in_ip",                limit: 255
    t.string   "confirmation_token",             limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",              limit: 255
    t.integer  "role_id",                        limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
