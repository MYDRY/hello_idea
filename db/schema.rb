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

ActiveRecord::Schema.define(version: 2018_11_06_073715) do

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "core_mandals", force: :cascade do |t|
    t.string "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_core_mandals_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.text "body"
    t.integer "topic_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_ideas_on_topic_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "idea_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_likes_on_idea_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "mandals", force: :cascade do |t|
    t.string "core"
    t.string "s1"
    t.string "s2"
    t.string "s3"
    t.string "s4"
    t.string "s5"
    t.string "s6"
    t.string "s7"
    t.string "s8"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string "message", null: false
    t.boolean "has_read", default: false, null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "simple_mandalarts", force: :cascade do |t|
    t.string "elem11"
    t.string "elem12"
    t.string "elem13"
    t.string "elem14"
    t.string "elem15"
    t.string "elem16"
    t.string "elem17"
    t.string "elem18"
    t.string "elem19"
    t.string "elem21"
    t.string "elem22"
    t.string "elem23"
    t.string "elem24"
    t.string "elem25"
    t.string "elem26"
    t.string "elem27"
    t.string "elem28"
    t.string "elem29"
    t.string "elem31"
    t.string "elem32"
    t.string "elem33"
    t.string "elem34"
    t.string "elem35"
    t.string "elem36"
    t.string "elem37"
    t.string "elem38"
    t.string "elem39"
    t.string "elem41"
    t.string "elem42"
    t.string "elem43"
    t.string "elem44"
    t.string "elem45"
    t.string "elem46"
    t.string "elem47"
    t.string "elem48"
    t.string "elem49"
    t.string "elem51"
    t.string "elem52"
    t.string "elem53"
    t.string "elem54"
    t.string "elem55"
    t.string "elem56"
    t.string "elem57"
    t.string "elem58"
    t.string "elem59"
    t.string "elem61"
    t.string "elem62"
    t.string "elem63"
    t.string "elem64"
    t.string "elem65"
    t.string "elem66"
    t.string "elem67"
    t.string "elem68"
    t.string "elem69"
    t.string "elem71"
    t.string "elem72"
    t.string "elem73"
    t.string "elem74"
    t.string "elem75"
    t.string "elem76"
    t.string "elem77"
    t.string "elem78"
    t.string "elem79"
    t.string "elem81"
    t.string "elem82"
    t.string "elem83"
    t.string "elem84"
    t.string "elem85"
    t.string "elem86"
    t.string "elem87"
    t.string "elem88"
    t.string "elem89"
    t.string "elem91"
    t.string "elem92"
    t.string "elem93"
    t.string "elem94"
    t.string "elem95"
    t.string "elem96"
    t.string "elem97"
    t.string "elem98"
    t.string "elem99"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_mandals", force: :cascade do |t|
    t.string "elem_1_1"
    t.string "elem_1_2"
    t.string "elem_1_3"
    t.string "elem_1_4"
    t.string "elem_1_5"
    t.string "elem_1_6"
    t.string "elem_1_7"
    t.string "elem_1_8"
    t.string "elem_1_9"
    t.string "elem_2_1"
    t.string "elem_2_2"
    t.string "elem_2_3"
    t.string "elem_2_4"
    t.string "elem_2_5"
    t.string "elem_2_6"
    t.string "elem_2_7"
    t.string "elem_2_8"
    t.string "elem_2_9"
    t.string "elem_3_1"
    t.string "elem_3_2"
    t.string "elem_3_3"
    t.string "elem_3_4"
    t.string "elem_3_5"
    t.string "elem_3_6"
    t.string "elem_3_7"
    t.string "elem_3_8"
    t.string "elem_3_9"
    t.string "elem_4_1"
    t.string "elem_4_2"
    t.string "elem_4_3"
    t.string "elem_4_4"
    t.string "elem_4_5"
    t.string "elem_4_6"
    t.string "elem_4_7"
    t.string "elem_4_8"
    t.string "elem_4_9"
    t.string "elem_5_1"
    t.string "elem_5_2"
    t.string "elem_5_3"
    t.string "elem_5_4"
    t.string "elem_5_5"
    t.string "elem_5_6"
    t.string "elem_5_7"
    t.string "elem_5_8"
    t.string "elem_5_9"
    t.string "elem_6_1"
    t.string "elem_6_2"
    t.string "elem_6_3"
    t.string "elem_6_4"
    t.string "elem_6_5"
    t.string "elem_6_6"
    t.string "elem_6_7"
    t.string "elem_6_8"
    t.string "elem_6_9"
    t.string "elem_7_1"
    t.string "elem_7_2"
    t.string "elem_7_3"
    t.string "elem_7_4"
    t.string "elem_7_5"
    t.string "elem_7_6"
    t.string "elem_7_7"
    t.string "elem_7_8"
    t.string "elem_7_9"
    t.string "elem_8_1"
    t.string "elem_8_2"
    t.string "elem_8_3"
    t.string "elem_8_4"
    t.string "elem_8_5"
    t.string "elem_8_6"
    t.string "elem_8_7"
    t.string "elem_8_8"
    t.string "elem_8_9"
    t.string "elem_9_1"
    t.string "elem_9_2"
    t.string "elem_9_3"
    t.string "elem_9_4"
    t.string "elem_9_5"
    t.string "elem_9_6"
    t.string "elem_9_7"
    t.string "elem_9_8"
    t.string "elem_9_9"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_simple_mandals_on_user_id"
  end

  create_table "sub_mandals", force: :cascade do |t|
    t.string "body"
    t.string "mandal_type"
    t.integer "mandal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mandal_type", "mandal_id"], name: "index_sub_mandals_on_mandal_type_and_mandal_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "genre_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_topics_on_genre_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

end
