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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_095232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agreements", force: :cascade do |t|
    t.bigint "request_id"
    t.string "title"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.index ["receiver_id"], name: "index_agreements_on_receiver_id"
    t.index ["request_id"], name: "index_agreements_on_request_id"
    t.index ["sender_id"], name: "index_agreements_on_sender_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "user_one_id", null: false
    t.bigint "user_two_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_one_id"], name: "index_chatrooms_on_user_one_id"
    t.index ["user_two_id"], name: "index_chatrooms_on_user_two_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "expertises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_feedbacks_on_request_id"
  end

  create_table "match_suggestions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "expertise_id", null: false
    t.index ["expertise_id"], name: "index_match_suggestions_on_expertise_id"
    t.index ["user_id"], name: "index_match_suggestions_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "receiver_id", null: false
    t.bigint "sender_id", null: false
    t.bigint "request_id"
    t.text "content"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["request_id"], name: "index_messages_on_request_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "expertise_id", null: false
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expertise_id"], name: "index_requests_on_expertise_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "user_expertises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "expertise_id", null: false
    t.index ["expertise_id"], name: "index_user_expertises_on_expertise_id"
    t.index ["user_id"], name: "index_user_expertises_on_user_id"
  end

  create_table "user_interests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "expertise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expertise_id"], name: "index_user_interests_on_expertise_id"
    t.index ["user_id"], name: "index_user_interests_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.text "about_me"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agreements", "requests"
  add_foreign_key "agreements", "users", column: "receiver_id"
  add_foreign_key "agreements", "users", column: "sender_id"
  add_foreign_key "chatrooms", "users", column: "user_one_id"
  add_foreign_key "chatrooms", "users", column: "user_two_id"
  add_foreign_key "chats", "users"
  add_foreign_key "feedbacks", "requests"
  add_foreign_key "match_suggestions", "expertises"
  add_foreign_key "match_suggestions", "users"
  add_foreign_key "messages", "requests"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "requests", "expertises"
  add_foreign_key "requests", "users"
  add_foreign_key "user_expertises", "expertises"
  add_foreign_key "user_expertises", "users"
  add_foreign_key "user_interests", "expertises"
  add_foreign_key "user_interests", "users"
  add_foreign_key "user_profiles", "users"
end
