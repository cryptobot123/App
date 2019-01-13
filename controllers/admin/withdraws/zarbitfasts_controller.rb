module Admin
  module Withdraws
    class ZarbitfastsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Zarbitfast'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_zarbitfasts = @zarbitfasts.with_aasm_state(:accepted).order("id DESC")
        @all_zarbitfasts = @zarbitfasts.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @zarbitfast.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @zarbitfast.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
