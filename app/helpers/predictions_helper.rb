module PredictionsHelper
  def header(params)
    options[symbol(params)]
  end

  def alt_header(params)
    if header(params) == "DJIA"
      link_to "SPX", root_path(symbol: :spx, market_timing: :close)
    else
      link_to "DJIA", root_path(symbol: :djia, market_timing: :close)
    end
  end
  
  private

  def symbol(params)
    params[:symbol].to_sym
  end

  def options
    Hash.new("N/A").merge({
      djia: "DJIA",
      spx: "SPX"
    })
  end
end
