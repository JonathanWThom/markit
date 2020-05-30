class PredictionsController < ApplicationController
  def index
    @prediction = PredictionPresenter.new(Prediction.last)
  end
end
