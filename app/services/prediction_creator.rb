class PredictionCreator
  def build_most_recent
    price = Price.order(:date).last

    ml = MlModels::DjiaClose.new
    ml.train
    prediction = ml.predict(price)
    projected_price = price.amount * (1 + prediction)

    Prediction.create!(
      price: price,
      projected_change: prediction,
      projected_price: projected_price,
    )
  end
end
