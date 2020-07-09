class PredictionsController < ApplicationController
  before_action :adjust_params
  def show 
    @prediction = PredictionPresenter.new(Prediction.find(params[:id]))
  end

  def index
    @predictions, @tally = PredictionPresenter.wrap(
      Prediction.where.not(actual_price: nil).order(created_at: :desc),
      params[:symbol],
      params[:market_timing],
    ) 
  end
  
  def last 
    @prediction, _tally = PredictionPresenter.wrap(
      Prediction.order(created_at: :desc).limit(1),
      params[:symbol],
      params[:market_timing],
    ).first
  end

  private

  # I am not proud of this. Default in routes didn't work as intended.
  def adjust_params
    params[:symbol] = "djia" if params[:symbol].blank?
    params[:market_timing] = "close" if params[:market_timing].blank?
  end
end
