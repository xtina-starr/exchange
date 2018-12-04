class Fulfillment < ApplicationRecord
  has_paper_trail class_name: 'PaperTrail::FulfillmentVersion'

  has_many :line_item_fulfillments, dependent: :destroy
  has_many :line_items, through: :line_item_fulfillments
end
