class Transaction < ApplicationRecord
  belongs_to :order

  TYPES = [
    HOLD = 'hold'.freeze,
    CAPTURE = 'capture'.freeze
  ].freeze
end
