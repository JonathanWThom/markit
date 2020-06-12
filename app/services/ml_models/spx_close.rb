module MlModels
  class SpxClose < Base
    private

    def symbol
      :spx
    end

    def market_timing
      :close
    end

    def filename
      "spx_close_model.pmml"
    end

    def report_model
      :spx_close
    end
  end
end
