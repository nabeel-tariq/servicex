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

ActiveRecord::Schema.define(version: 20171004152252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id", using: :btree
  end

  create_table "biddings", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "contractor_service_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["contractor_service_id"], name: "index_biddings_on_contractor_service_id", using: :btree
    t.index ["job_id"], name: "index_biddings_on_job_id", using: :btree
  end

  create_table "contact_numbers", force: :cascade do |t|
    t.string   "text_value"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contact_numbers_on_contactable_type_and_contactable_id", using: :btree
  end

  create_table "contractor_services", force: :cascade do |t|
    t.integer  "contractor_id"
    t.integer  "service_id"
    t.integer  "status_id"
    t.string   "status_changed_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["contractor_id"], name: "index_contractor_services_on_contractor_id", using: :btree
    t.index ["service_id"], name: "index_contractor_services_on_service_id", using: :btree
  end

  create_table "contractors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "shop_name"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status_id"
    t.integer  "employer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employer_id"], name: "index_jobs_on_employer_id", using: :btree
  end

  create_table "location_contractor_services", force: :cascade do |t|
    t.integer  "contractor_service_id"
    t.integer  "location_id"
    t.boolean  "is_enable"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["contractor_service_id"], name: "index_location_contractor_services_on_contractor_service_id", using: :btree
    t.index ["location_id"], name: "index_location_contractor_services_on_location_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "locationable_type"
    t.integer  "locationable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["locationable_type", "locationable_id"], name: "index_locations_on_locationable_type_and_locationable_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "contractor_id"
    t.integer  "job_id"
    t.integer  "bidding_id"
    t.integer  "status_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["bidding_id"], name: "index_orders_on_bidding_id", using: :btree
    t.index ["contractor_id"], name: "index_orders_on_contractor_id", using: :btree
    t.index ["job_id"], name: "index_orders_on_job_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id", using: :btree
  end

  create_table "service_categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "service_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["service_category_id"], name: "index_services_on_service_category_id", using: :btree
  end

  create_table "tech_talks", force: :cascade do |t|
    t.integer  "test_id_id"
    t.integer  "tech_talk_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "technician_orders", force: :cascade do |t|
    t.integer  "technician_id"
    t.integer  "order_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_id"], name: "index_technician_orders_on_order_id", using: :btree
    t.index ["technician_id"], name: "index_technician_orders_on_technician_id", using: :btree
  end

  create_table "technicians", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profileable_type"
    t.integer  "profileable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["profileable_type", "profileable_id"], name: "index_users_on_profileable_type_and_profileable_id", using: :btree
  end

  add_foreign_key "biddings", "contractor_services"
  add_foreign_key "biddings", "jobs"
  add_foreign_key "contractor_services", "contractors"
  add_foreign_key "contractor_services", "services"
  add_foreign_key "jobs", "employers"
  add_foreign_key "location_contractor_services", "contractor_services"
  add_foreign_key "location_contractor_services", "locations"
  add_foreign_key "orders", "biddings"
  add_foreign_key "orders", "contractors"
  add_foreign_key "orders", "jobs"
  add_foreign_key "payments", "orders"
  add_foreign_key "services", "service_categories"
  add_foreign_key "technician_orders", "orders"
  add_foreign_key "technician_orders", "technicians"
end
