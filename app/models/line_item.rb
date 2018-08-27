class LineItem < ApplicationRecord
  belongs_to :order
  has_many :line_item_fulfillments, dependent: :destroy
  has_many :fulfillments, through: :line_item_fulfillments

  after_save :update_order_totals

  def update_order_totals
    self.order.save!
  end
end
