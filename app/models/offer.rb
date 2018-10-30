class Offer < ApplicationRecord
  STATES = [
    ACCEPTED = 'accepted'.freeze,
    REJECTED = 'rejected'.freeze
  ].freeze

  belongs_to :order
  belongs_to :responds_to, class_name: 'Offer', optional: true

  validates :state, inclusion: STATES, allow_nil: true
end
