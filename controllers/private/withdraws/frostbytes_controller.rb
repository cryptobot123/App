module Private::Withdraws
  class FrostbytesController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
