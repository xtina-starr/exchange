class LineItem < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :order

  def attributes
    {
      id: nil,
      price_cents: nil,
      artwork_id: nil,
      edition_set_id: nil
    }
  end
end
