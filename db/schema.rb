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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170613025910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "episodes", force: :cascade do |t|
    t.string   "video_id"
    t.string   "title"
    t.datetime "published_at"
    t.text     "description"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "sort_order"
    t.boolean  "active",       default: true, null: false
    t.integer  "video_site",   default: 1,    null: false
    t.integer  "view_count",   default: 0
  end

  add_index "episodes", ["video_id"], name: "index_episodes_on_video_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "webuild_id",                                              null: false
    t.string   "group_id",                                                null: false
    t.string   "platform",                                                null: false
    t.string   "name",                                                    null: false
    t.text     "description"
    t.string   "location"
    t.string   "url"
    t.string   "group_name"
    t.string   "group_url"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "latitude",       precision: 15, scale: 10
    t.decimal  "longitude",      precision: 15, scale: 10
    t.boolean  "to_be_recorded",                           default: true
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "events", ["webuild_id", "group_id", "platform"], name: "index_events_on_webuild_id_and_group_id_and_platform", using: :btree

  create_table "featured_videos", force: :cascade do |t|
    t.integer "episode_id",                null: false
    t.integer "sequence",   default: 0,    null: false
    t.boolean "active",     default: true, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "title",                         null: false
    t.text     "description"
    t.string   "website"
    t.string   "twitter"
    t.string   "contact_person"
    t.boolean  "active",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image"
    t.string   "slug"
  end

  add_index "organizations", ["slug"], name: "index_organizations_on_slug", using: :btree
  add_index "organizations", ["twitter"], name: "index_organizations_on_twitter", using: :btree

  create_table "playlist_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "playlist_items", force: :cascade do |t|
    t.integer  "playlist_id", null: false
    t.integer  "episode_id",  null: false
    t.integer  "sort_order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playlist_items", ["episode_id"], name: "index_playlist_items_on_episode_id", using: :btree
  add_index "playlist_items", ["playlist_id"], name: "index_playlist_items_on_playlist_id", using: :btree
  add_index "playlist_items", ["sort_order"], name: "index_playlist_items_on_sort_order", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "playlist_id"
    t.string   "name"
    t.text     "description"
    t.date     "publish_date"
    t.string   "image"
    t.boolean  "active",               default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "website"
    t.string   "hashtag"
    t.integer  "playlist_category_id"
    t.string   "slug"
  end

  add_index "playlists", ["active"], name: "index_playlists_on_active", using: :btree
  add_index "playlists", ["playlist_category_id"], name: "index_playlists_on_playlist_category_id", using: :btree
  add_index "playlists", ["playlist_id"], name: "index_playlists_on_playlist_id", using: :btree

  create_table "presenters", force: :cascade do |t|
    t.string   "name",                      null: false
    t.text     "biography"
    t.string   "twitter"
    t.string   "email"
    t.string   "website"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "byline"
    t.string   "avatar_url"
  end

  add_index "presenters", ["twitter"], name: "index_presenters_on_twitter", using: :btree

  create_table "sub_playlists", force: :cascade do |t|
    t.integer  "playlist_id",                 null: false
    t.integer  "sub_playlist_id",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "sequence",        default: 1, null: false
  end

  add_index "sub_playlists", ["playlist_id"], name: "index_sub_playlists_on_playlist_id", using: :btree
  add_index "sub_playlists", ["sub_playlist_id"], name: "index_sub_playlists_on_sub_playlist_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "twitter"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_links", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "episode_id"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "video_links", ["episode_id"], name: "index_video_links_on_episode_id", using: :btree

  create_table "video_organizations", force: :cascade do |t|
    t.integer  "episode_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "video_organizations", ["episode_id"], name: "index_video_organizations_on_episode_id", using: :btree
  add_index "video_organizations", ["organization_id"], name: "index_video_organizations_on_organization_id", using: :btree

  create_table "video_presenters", force: :cascade do |t|
    t.integer  "episode_id"
    t.integer  "presenter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "video_presenters", ["episode_id"], name: "index_video_presenters_on_episode_id", using: :btree
  add_index "video_presenters", ["presenter_id"], name: "index_video_presenters_on_presenter_id", using: :btree

  add_foreign_key "video_links", "episodes"
  add_foreign_key "video_organizations", "episodes"
  add_foreign_key "video_organizations", "organizations"
  add_foreign_key "video_presenters", "episodes"
  add_foreign_key "video_presenters", "presenters"
end
