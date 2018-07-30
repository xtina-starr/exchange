class Fulfillment < ApplicationRecord
  has_many :line_item_fulfillments, dependent: :destroy
  has_many :line_items, through: :line_item_fulfillments
end
