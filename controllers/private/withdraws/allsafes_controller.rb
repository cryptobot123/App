module Private::Withdraws
  class AllsafesController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
