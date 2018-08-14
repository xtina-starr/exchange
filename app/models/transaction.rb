class Transaction < ApplicationRecord
  belongs_to :order

  TYPES = [
    HOLD = 'hold'.freeze,
    CAPTURE = 'capture'.freeze,
    REFUND = 'refund'.freeze
  ].freeze

  STATUSES = [
    SUCCESS = 'success'.freeze,
    FAILURE = 'failure'.freeze
  ].freeze
end
