module Private
  module Deposits
    class ZarbitfastsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
