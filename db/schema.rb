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

ActiveRecord::Schema.define(version: 20171216124544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "cube"
  enable_extension "earthdistance"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "is_active",              default: true
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "status"
    t.string   "image_type"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id", using: :btree
  end

  create_table "authentications", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "biddings", force: :cascade do |t|
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.integer  "status"
    t.integer  "amount"
    t.datetime "time"
    t.index ["job_id"], name: "index_biddings_on_job_id", using: :btree
  end

  create_table "biddings_contractors", id: false, force: :cascade do |t|
    t.integer "bidding_id"
    t.integer "contractor_id"
    t.index ["bidding_id", "contractor_id"], name: "index_biddings_contractors_on_bidding_id_and_contractor_id", using: :btree
    t.index ["bidding_id"], name: "index_biddings_contractors_on_bidding_id", using: :btree
    t.index ["contractor_id"], name: "index_biddings_contractors_on_contractor_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "state_id"
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "contact_numbers", force: :cascade do |t|
    t.string   "text_value"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "number_type"
    t.integer  "status"
    t.string   "otp"
    t.datetime "otp_sent_at"
    t.index ["contactable_type", "contactable_id"], name: "index_contact_numbers_on_contactable_type_and_contactable_id", using: :btree
  end

  create_table "contractor_services", force: :cascade do |t|
    t.integer  "contractor_id"
    t.integer  "service_id"
    t.integer  "status"
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
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "contractor_type"
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
    t.integer  "status",      default: 0
    t.integer  "employer_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "budget"
    t.datetime "time"
    t.integer  "ad_type"
    t.index ["employer_id"], name: "index_jobs_on_employer_id", using: :btree
  end

  create_table "jobs_services", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_jobs_services_on_job_id", using: :btree
    t.index ["service_id"], name: "index_jobs_services_on_service_id", using: :btree
  end

  create_table "location_contractor_services", force: :cascade do |t|
    t.integer  "contractor_service_id"
    t.boolean  "is_enable"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["contractor_service_id"], name: "index_location_contractor_services_on_contractor_service_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "locationable_type"
    t.integer  "locationable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "address_1"
    t.string   "address_2"
    t.string   "zip_code"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "radius"
    t.index ["city_id"], name: "index_locations_on_city_id", using: :btree
    t.index ["locationable_type", "locationable_id"], name: "index_locations_on_locationable_type_and_locationable_id", using: :btree
    t.index ["state_id"], name: "index_locations_on_state_id", using: :btree
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
    t.index ["type"], name: "index_mailboxer_notifications_on_type", using: :btree
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "bidding_id"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "amount"
    t.text     "remarks"
    t.datetime "ending_date"
    t.index ["bidding_id"], name: "index_orders_on_bidding_id", using: :btree
    t.index ["job_id"], name: "index_orders_on_job_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "status"
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
    t.integer  "service_type"
    t.index ["service_category_id"], name: "index_services_on_service_category_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "contractor_id"
    t.index ["contractor_id"], name: "index_technicians_on_contractor_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profileable_type"
    t.integer  "profileable_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "account_stage",          default: 0
    t.integer  "employer_id"
    t.integer  "contractor_id"
    t.boolean  "is_employer",            default: true
    t.boolean  "is_active",              default: true
    t.index ["contractor_id"], name: "index_users_on_contractor_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["employer_id"], name: "index_users_on_employer_id", using: :btree
    t.index ["profileable_type", "profileable_id"], name: "index_users_on_profileable_type_and_profileable_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "biddings", "jobs"
  add_foreign_key "cities", "states"
  add_foreign_key "contractor_services", "contractors"
  add_foreign_key "contractor_services", "services"
  add_foreign_key "jobs", "employers"
  add_foreign_key "jobs_services", "jobs"
  add_foreign_key "jobs_services", "services"
  add_foreign_key "location_contractor_services", "contractor_services"
  add_foreign_key "locations", "cities"
  add_foreign_key "locations", "states"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "orders", "biddings"
  add_foreign_key "orders", "jobs"
  add_foreign_key "payments", "orders"
  add_foreign_key "services", "service_categories"
  add_foreign_key "technician_orders", "orders"
  add_foreign_key "technician_orders", "technicians"
  add_foreign_key "technicians", "contractors"
  add_foreign_key "users", "contractors"
  add_foreign_key "users", "employers"
end
