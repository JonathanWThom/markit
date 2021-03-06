module MlModels
  class DjiaClose < Base
    private

    def symbol
      :djia
    end

    def market_timing
      :close
    end

    def filename
      "djia_close_model.pmml"
    end

    def report_model
      :djia_close
    end
  end
end
