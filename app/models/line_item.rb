class LineItem < ApplicationRecord
  include LineItemHelper

  has_paper_trail versions: { class_name: 'PaperTrail::LineItemVersion' }

  belongs_to :order
  has_many :line_item_fulfillments, dependent: :destroy
  has_many :fulfillments, through: :line_item_fulfillments

  validate :offer_order_lacks_line_items, on: :create

  validates :artwork_version_id, presence: true
  validates :artwork_id, presence: true

  def total_list_price_cents
    list_price_cents * quantity
  end

  private

  def offer_order_lacks_line_items
    if order.mode == Order::OFFER && order.line_items.any?
      errors.add(:order, 'offer order can only have one line item')
    end
  end
end
