module Api
  class OrdersController < ApplicationController
    def create
      order = OrderService.create!(create_params)
      render json: { order: order.serializable_hash }
    end

    private

    def create_params
      params.require(:order).permit(:user_id, :partner_id).tap do |create_params|
        create_params.require([:user_id, :partner_id])
      end.to_h
    end
  end
end
