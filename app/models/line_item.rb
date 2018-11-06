class LineItem < ApplicationRecord
  belongs_to :order
  has_many :line_item_fulfillments, dependent: :destroy
  has_many :fulfillments, through: :line_item_fulfillments

  before_create :validate_creation

  def total_amount_cents
    order.mode == Order::BUY ? total_list_price : order.last_offer&.amount_cents
  end

  def total_list_price
    list_price_cents * quantity
  end

  private

  def validate_creation
    # Offer orders can have only one line item
    raise Errors::ValidationError, :offer_more_than_one_line_item if order.mode == Order::OFFER && order.line_items.exists?
  end
end
