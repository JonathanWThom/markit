class PredictionsController < ApplicationController
  def show 
    @prediction = PredictionPresenter.new(Prediction.find(params[:id]))
  end

  def index
    @predictions = PredictionPresenter.wrap(Prediction.where.not(actual_price: nil)) # be sure to update this if other indexes are supported
  end
end
