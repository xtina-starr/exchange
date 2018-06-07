class Order < ApplicationRecord
  include ActiveModel::Serializers::JSON

  has_many :line_items, class_name: 'OrderLineItem'

  before_create :set_code

  def set_code
    self.code = SecureRandom.hex(10)
  end

  def attributes
    {
      id: nil,
      code: nil,
      user_id: nil,
      partner_id: nil
    }
  end
end
