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

ActiveRecord::Schema.define(version: 20170804074514) do

  create_table "guests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id_hash",                                       null: false
    t.string   "name",                                          null: false
    t.string   "post_number",                                   null: false
    t.string   "address",                                       null: false
    t.string   "phone_number"
    t.boolean  "sex_bit",                                       null: false
    t.boolean  "child_bit",                     default: false, null: false
    t.text     "invite_message",  limit: 65535
    t.boolean  "host_bit",                                      null: false
    t.text     "tomo_message",    limit: 65535
    t.text     "eri_message",     limit: 65535
    t.boolean  "attend_bit"
    t.text     "guest_message",   limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "allergy_comment", limit: 65535
  end

end
