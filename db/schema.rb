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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121116113204) do

  create_table "applies", :force => true do |t|
    t.integer  "chapter_id"
    t.integer  "owner_id"
    t.integer  "applicant_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "status"
  end

  create_table "chapters", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "loved_book_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "description"
    t.integer  "processing",    :default => 0
    t.datetime "deadline"
    t.integer  "chapter_id"
    t.integer  "user_id"
  end

  create_table "chapters_users", :id => false, :force => true do |t|
    t.integer "chapter_id"
    t.integer "user_id"
  end

  create_table "editions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loved_books", :force => true do |t|
    t.string   "book_name"
    t.text     "book_description"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "loved_books", ["user_id", "created_at"], :name => "index_loved_books_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
