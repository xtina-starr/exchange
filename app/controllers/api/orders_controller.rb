module Api
  class OrdersController < ApplicationController
    before_action :verify_user!

    def create
      raise(Errors::OrderError.new('Existing pending order.')) if OrderService.create_params_has_pending_order?(create_params)
      order = OrderService.create!(create_params)
      render json: { order: order.serializable_hash(include: [:line_items]) }
    end

    def submit
      order = Order.find(params[:id])
      OrderService.submit!(order, submit_params.slice(:shipping_info, :credit_card_id))
      render json: { order: order.serializable_hash(include: [:line_items])}
    end

    private

    def create_params
      params.require(:order).permit(:user_id, :partner_id, line_items: %i(artwork_id edition_set_id price_cents)).tap do |create_params|
        create_params.require([:user_id, :partner_id, :line_items])
      end.to_h
    end

    def submit_params
      params.requre(:order).permit(:shipping_info, :credit_card_id)
    end

    def verify_user!
      raise(Errors::AuthError.new('Not Permitted.')) if params.dig(:order, :user_id).nil? || current_user['id'] != params.dig(:order, :user_id)
    end
  end
end
