class Transaction < ApplicationRecord
  belongs_to :order

  TYPES = [
    HOLD = 'hold'.freeze,
    CAPTURE = 'capture'.freeze,
    REFUND = 'refund'.freeze
  ].freeze
end
