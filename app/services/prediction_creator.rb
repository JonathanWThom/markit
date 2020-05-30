class PredictionCreator
  def build_most_recent
    price = Price.order(:date).last

    ml = MlModels::DjiaClose.new
    ml.train
    prediction = ml.predict(price)

    Prediction.create!(
      date: price.date,
      projected_change: prediction
    )
  end
end
