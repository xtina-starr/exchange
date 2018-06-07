module Api
  class OrdersController < ApplicationController
    def create
      order = OrderService.create!(create_params)
      render json: { order: order.serializable_hash(include: [:line_items]) }
    end

    private

    def create_params
      params.require(:order).permit(:user_id, :partner_id, line_items: %i(artwork_id edition_set_id price_cents)).tap do |create_params|
        create_params.require([:user_id, :partner_id])
      end.to_h
    end
  end
end
