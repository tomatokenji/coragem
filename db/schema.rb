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

ActiveRecord::Schema.define(version: 20170308023714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approvals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "approver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["approver_id"], name: "index_approvals_on_approver_id", using: :btree
    t.index ["user_id"], name: "index_approvals_on_user_id", using: :btree
  end

  create_table "notification_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notification_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["notification_id"], name: "index_notification_users_on_notification_id", using: :btree
    t.index ["user_id"], name: "index_notification_users_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "notification"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "project_files", force: :cascade do |t|
    t.string   "file_url"
    t.string   "type"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_files_on_project_id", using: :btree
  end

  create_table "project_followings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "following_project_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["follower_id"], name: "index_project_followings_on_follower_id", using: :btree
    t.index ["following_project_id"], name: "index_project_followings_on_following_project_id", using: :btree
  end

  create_table "project_photos", force: :cascade do |t|
    t.string   "photo_url"
    t.string   "type"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_photos_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "objectives"
    t.text     "description"
    t.text     "project_scope"
    t.text     "talents_needed"
    t.text     "budget"
    t.string   "status"
    t.string   "project_profile_picture_id"
    t.string   "project_proposal_id"
    t.integer  "project_approver_id"
    t.integer  "project_manager_id"
    t.integer  "user_id"
    t.integer  "status_project_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["project_approver_id"], name: "index_projects_on_project_approver_id", using: :btree
    t.index ["project_manager_id"], name: "index_projects_on_project_manager_id", using: :btree
    t.index ["status_project_id"], name: "index_projects_on_status_project_id", using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "status_projects", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "image"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthday"
    t.string   "interests"
    t.text     "skills"
    t.string   "department"
    t.string   "linkedin"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "approvals", "users"
  add_foreign_key "approvals", "users", column: "approver_id"
  add_foreign_key "notification_users", "notifications"
  add_foreign_key "notification_users", "users"
  add_foreign_key "project_files", "projects"
  add_foreign_key "project_followings", "projects", column: "following_project_id"
  add_foreign_key "project_followings", "users", column: "follower_id"
  add_foreign_key "project_photos", "projects"
  add_foreign_key "projects", "status_projects"
  add_foreign_key "projects", "users"
  add_foreign_key "projects", "users", column: "project_approver_id"
  add_foreign_key "projects", "users", column: "project_manager_id"
end
