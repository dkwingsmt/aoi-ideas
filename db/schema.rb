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

ActiveRecord::Schema.define(:version => 20130209014825) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                    :null => false
    t.integer  "entry_id",                   :null => false
    t.text     "body",       :default => ""
    t.string   "disabled",                   :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.string   "title",      :default => ""
    t.text     "abstract",   :default => ""
    t.text     "body",       :default => ""
    t.integer  "category",                      :null => false
    t.boolean  "published",                     :null => false
    t.boolean  "disabled",   :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "marks", :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "entry_id", :null => false
    t.integer "score",    :null => false
  end

  add_index "marks", ["entry_id", "user_id"], :name => "index_marks_on_entry_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                :null => false
    t.string   "hashed_password",                      :null => false
    t.string   "name",                                 :null => false
    t.datetime "lastlogin",                            :null => false
    t.boolean  "gender",                               :null => false
    t.string   "locale",          :default => "UTF-8"
    t.string   "avatar"
    t.boolean  "disabled",                             :null => false
    t.boolean  "admin",                                :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
