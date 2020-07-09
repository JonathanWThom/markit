# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_09_035455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accuracy_reports", force: :cascade do |t|
    t.integer "model", null: false
    t.decimal "rmse"
    t.decimal "mae"
    t.decimal "me"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model"], name: "index_accuracy_reports_on_model"
  end

  create_table "average_sentiments", force: :cascade do |t|
    t.integer "trait"
    t.integer "source"
    t.decimal "value"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prediction_tally_reports", force: :cascade do |t|
    t.integer "market_timing", null: false
    t.integer "symbol", null: false
    t.integer "total", null: false
    t.integer "correct", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "predictions", force: :cascade do |t|
    t.bigint "price_id"
    t.decimal "projected_change", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "actual_change"
    t.decimal "projected_price"
    t.decimal "actual_price"
    t.index ["price_id"], name: "index_predictions_on_price_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "symbol", default: 0, null: false
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.integer "market_timing", default: 0, null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["amount"], name: "index_prices_on_amount"
    t.index ["date"], name: "index_prices_on_date"
    t.index ["market_timing"], name: "index_prices_on_market_timing"
    t.index ["symbol"], name: "index_prices_on_symbol"
  end

  create_table "sentiments", force: :cascade do |t|
    t.integer "source"
    t.text "text"
    t.string "sentiment"
    t.decimal "positive"
    t.decimal "neutral"
    t.decimal "negative"
    t.decimal "mixed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "predictions", "prices"
end
