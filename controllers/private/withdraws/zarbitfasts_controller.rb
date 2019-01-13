module Private::Withdraws
  class ZarbitfastsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
