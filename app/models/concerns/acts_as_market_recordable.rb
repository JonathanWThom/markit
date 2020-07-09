module ActsAsMarketRecordable
  extend ActiveSupport::Concern

  included do
    enum market_timing: { close: 0 }
    enum symbol: { djia: 0, spx: 1, vix: 2 }
  end
end
