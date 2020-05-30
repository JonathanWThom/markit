class PredictionCreator
  def build_most_recent
    price = Price.order(:date).last

    ml = MlModels::DjiaClose.new
    ml.train
    prediction = ml.predict(price)

    Prediction.create!(
      price: price,
      projected_change: prediction
    )
  end
end
