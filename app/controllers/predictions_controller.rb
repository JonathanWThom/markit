class PredictionsController < ApplicationController
  def show 
    @prediction = PredictionPresenter.new(Prediction.find(params[:id]))
  end

  def index
    @predictions = PredictionPresenter.wrap(
      Prediction.where.not(actual_price: nil).order(created_at: :desc)
    ) # be sure to update this if other indexes are supported
  end
  
  def last 
    @prediction = PredictionPresenter.new(Prediction.last)
  end
end
