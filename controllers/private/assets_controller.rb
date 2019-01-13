module Private
  class AssetsController < BaseController
    skip_before_action :auth_member!, only: [:index]

    def index
      # @cny_assets  = Currency.assets('cny')
      @cny_assets  = Currency.assets('usd')
      @btc_proof   = Proof.current :btc
      @doge_proof   = Proof.current :doge
      @zzf_proof   = Proof.current :zzf
      @fstx_proof   = Proof.current :fstx
      @safe_proof   = Proof.current :safe
      @ltc_proof   = Proof.current :ltc
      @ppc_proof   = Proof.current :ppc
      @blk_proof   = Proof.current :blk
      @rpt_proof   = Proof.current :rpt
      @trt_proof   = Proof.current :trt
      # @cny_proof   = Proof.current :cny
      @cny_proof   = Proof.current :usd

      if current_user
        @btc_account = current_user.accounts.with_currency(:btc).first
        @doge_account = current_user.accounts.with_currency(:doge).first
        @zzf_account = current_user.accounts.with_currency(:zzf).first
        @fstx_account = current_user.accounts.with_currency(:fstx).first
        @safe_account = current_user.accounts.with_currency(:safe).first
        @ltc_account = current_user.accounts.with_currency(:ltc).first
        @ppc_account = current_user.accounts.with_currency(:ppc).first
        @blk_account = current_user.accounts.with_currency(:blk).first
        @rpt_account = current_user.accounts.with_currency(:rpt).first
        @trt_account = current_user.accounts.with_currency(:trt).first
        # @cny_account = current_user.accounts.with_currency(:cny).first
        @cny_account = current_user.accounts.with_currency(:usd).first
      end
    end

    def partial_tree
      account    = current_user.accounts.with_currency(params[:id]).first
      @timestamp = Proof.with_currency(params[:id]).last.timestamp
      @json      = account.partial_tree.to_json.html_safe
      respond_to do |format|
        format.js
      end
    end

  end
end
