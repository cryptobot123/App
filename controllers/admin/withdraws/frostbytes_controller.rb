module Admin
  module Withdraws
    class FrostbytesController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Frostbyte'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_frostbytes = @frostbytes.with_aasm_state(:accepted).order("id DESC")
        @all_frostbytes = @frostbytes.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @frostbyte.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @frostbyte.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
