module Api
  class OrdersController < ApplicationController
    def create
      render json: {result: :ok}
    end
  end
end
