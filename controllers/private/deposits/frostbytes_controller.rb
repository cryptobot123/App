module Private
  module Deposits
    class FrostbyesController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
