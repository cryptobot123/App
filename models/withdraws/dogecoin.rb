module Withdraws
  class Dogecoin < ::Withdraw
    include ::AasmAbsolutely
    include ::Withdraws::Coinable
    include ::FundSourceable
    
    def set_fee
      self.fee = "0.0005".to_d
    end

  end
end
