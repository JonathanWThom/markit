module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :prediction, PredictionType, null: true do
      description "Find a prediction by ID"
      argument :id, ID, required: true
    end

    field :predictions, PredictionType.connection_type, null: false do
      description "All predictions"
      argument :symbol, String, required: false
    end
    
    def prediction(id:)
      Prediction.find(id)
    end

    def predictions(symbol: [:spx, :djia])
      Prediction.joins(:price).where(prices: { symbol: symbol })
    end
  end
end
