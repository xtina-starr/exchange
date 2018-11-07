class LineItem < ApplicationRecord
  belongs_to :order
  has_many :line_item_fulfillments, dependent: :destroy
  has_many :fulfillments, through: :line_item_fulfillments

  validate :offer_order_lacks_line_items, on: :create

  def total_amount_cents
    order.mode == Order::BUY ? total_list_price_cents : order.last_offer&.amount_cents
  end

  def total_list_price_cents
    list_price_cents * quantity
  end

  def effective_price_cents
    # calculates effective price considering order type
    total_amount_cents / quantity
  end

  private

  def offer_order_lacks_line_items
    errors.add(:order, 'offer order can only have one line item') if order.mode == Order::OFFER && order.line_items.any?
  end
end
