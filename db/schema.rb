ActiveRecord::Schema.define(version: 2022_04_18_143836) do

  enable_extension "plpgsql"

  create_table "daily_flow_charts", force: :cascade do |t|
    t.date "date"
    t.boolean "bloating", default: false
    t.boolean "cramps", default: false
    t.text "emotions"
    t.integer "flow_status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_daily_flow_charts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  add_foreign_key "daily_flow_charts", "users"
end
