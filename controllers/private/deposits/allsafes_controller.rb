module Private
  module Deposits
    class AllsafesController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
