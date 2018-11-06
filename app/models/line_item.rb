class LineItem < ApplicationRecord
  belongs_to :order
  has_many :line_item_fulfillments, dependent: :destroy
  has_many :fulfillments, through: :line_item_fulfillments

  def total_amount_cents
    order.mode == Order::BUY ? list_price_cents * quantity : order.last_offer.amount_cents
  end
end
