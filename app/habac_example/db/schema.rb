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

ActiveRecord::Schema[7.0].define(version: 2022_11_21_070758) do
  create_table "auth_rules", force: :cascade do |t|
    t.string "ua"
    t.string "uav"
    t.string "da"
    t.string "dav"
    t.string "oa"
    t.string "oav"
    t.string "esa"
    t.string "esav"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_attributes", force: :cascade do |t|
    t.string "name"
    t.string "values"
    t.integer "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_device_attributes_on_device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "environment_state_attributes", force: :cascade do |t|
    t.string "name"
    t.string "values"
    t.integer "environment_state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment_state_id"], name: "index_environment_state_attributes_on_environment_state_id"
  end

  create_table "environment_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operation_attributes", force: :cascade do |t|
    t.string "name"
    t.string "values"
    t.integer "operation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_id"], name: "index_operation_attributes_on_operation_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "name"
    t.integer "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_operations_on_device_id"
  end

  create_table "user_attributes", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_attributes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "device_attributes", "devices"
  add_foreign_key "environment_state_attributes", "environment_states"
  add_foreign_key "operation_attributes", "operations"
  add_foreign_key "operations", "devices"
  add_foreign_key "user_attributes", "users"
end
