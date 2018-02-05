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

ActiveRecord::Schema.define(version: 20180205142958) do

  create_table "armors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.integer "defense_points", default: 0, null: false
    t.integer "durability", default: 0, null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.integer "attack_points", default: 0, null: false
    t.integer "durability", default: 0, null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zombie_armors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "zombie_id"
    t.bigint "armor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["armor_id"], name: "index_zombie_armors_on_armor_id"
    t.index ["zombie_id"], name: "index_zombie_armors_on_zombie_id"
  end

  create_table "zombie_weapons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "zombie_id"
    t.bigint "weapon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weapon_id"], name: "index_zombie_weapons_on_weapon_id"
    t.index ["zombie_id"], name: "index_zombie_weapons_on_zombie_id"
  end

  create_table "zombies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.integer "hit_points", default: 0, null: false
    t.integer "brains_eaten", default: 0, null: false
    t.integer "speed", default: 0, null: false
    t.datetime "turn_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "zombie_armors", "armors"
  add_foreign_key "zombie_armors", "zombies"
  add_foreign_key "zombie_weapons", "weapons"
  add_foreign_key "zombie_weapons", "zombies"
end
