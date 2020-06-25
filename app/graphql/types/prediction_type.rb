module Types
  class PredictionType < Types::BaseObject
    field :id, ID, null: false
    field :projected_change, Float, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :actual_change, Float, null: true
    field :projected_price, Float, null: true
    field :actual_price, Float, null: true
  end
end
