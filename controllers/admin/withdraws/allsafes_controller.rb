module Admin
  module Withdraws
    class AllsafesController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Allsafe'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_allsafes = @allsafes.with_aasm_state(:accepted).order("id DESC")
        @all_allsafes = @allsafes.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @allsafe.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @allsafe.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
