class LineItemFulfillment < ApplicationRecord
  belongs_to :line_item
  belongs_to :fulfillment
end
