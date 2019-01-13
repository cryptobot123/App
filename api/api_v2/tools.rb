# encoding: UTF-8
# frozen_string_literal: true

module APIv2
  class Tools < Grape::API
    desc 'Get server current time, in seconds since Unix epoch.'
    get "/timestamp" do
      ({"serverTime": (Time.now.to_f * 1000).to_i})
    end
  end
end