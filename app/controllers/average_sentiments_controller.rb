class AverageSentimentsController < ApplicationController
  def index
    respond_to do |format|
      format.csv { send_csv(AverageSentiment.to_csv) }
    end
  end

  private

  def send_csv(csv)
    send_data(
      csv,
      type: "text/csv; charset=iso-8859-1; header=present",
      disposition: "attachment",
      filename: "average_sentiments_#{Time.current.to_i}.csv"
    )
  end
end
