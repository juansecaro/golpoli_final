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

ActiveRecord::Schema.define(version: 20171103025356) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "job_title"
    t.text     "other"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_contacts_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "cif"
    t.string   "address"
    t.text     "description"
    t.integer  "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "bank"
    t.string   "bank_no"
    t.string   "paypal"
    t.string   "img_source"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.string   "name"
    t.decimal  "normal_price"
    t.decimal  "special_price"
    t.boolean  "active"
    t.string   "kind"
    t.text     "other"
    t.string   "image"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_pitches_on_institution_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "institution_id"
    t.integer  "pitch_id"
    t.integer  "user_id"
    t.string   "user_email"
    t.string   "charge_id",      default: ""
    t.decimal  "amount"
    t.date     "selected_date"
    t.string   "selected_times", default: ""
    t.boolean  "refund",         default: true
    t.string   "refund_reason",  default: ""
    t.decimal  "refunded",       default: "0.0"
    t.string   "fingerprint"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["institution_id"], name: "index_reservations_on_institution_id"
    t.index ["pitch_id"], name: "index_reservations_on_pitch_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "pitch_id"
    t.date     "date_ref"
    t.integer  "h0"
    t.integer  "h1"
    t.integer  "h2"
    t.integer  "h3"
    t.integer  "h4"
    t.integer  "h5"
    t.integer  "h6"
    t.integer  "h7"
    t.integer  "h8"
    t.integer  "h9"
    t.integer  "h10"
    t.integer  "h11"
    t.integer  "h12"
    t.integer  "h13"
    t.integer  "h14"
    t.integer  "h15"
    t.integer  "h16"
    t.integer  "h17"
    t.integer  "h18"
    t.integer  "h19"
    t.integer  "h20"
    t.integer  "h21"
    t.integer  "h22"
    t.integer  "h23"
    t.integer  "h24"
    t.integer  "h25"
    t.integer  "h26"
    t.integer  "h27"
    t.integer  "h28"
    t.integer  "h29"
    t.integer  "h30"
    t.integer  "h31"
    t.integer  "h32"
    t.integer  "h33"
    t.integer  "h34"
    t.integer  "h35"
    t.integer  "h36"
    t.integer  "h37"
    t.integer  "h38"
    t.integer  "h39"
    t.integer  "h40"
    t.integer  "h41"
    t.integer  "h42"
    t.integer  "h43"
    t.integer  "h44"
    t.integer  "h45"
    t.integer  "h46"
    t.integer  "h47"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_schedules_on_pitch_id"
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
