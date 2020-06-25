module Types
  class PredictionType < Types::BaseObject
    field :projected_change, Float, null: false
    field :date, GraphQL::Types::ISO8601DateTime, null: false
    field :actual_change, Float, null: true
    field :projected_price, Float, null: true
    field :actual_price, Float, null: true
    field :symbol, String, null: false
  end
end
