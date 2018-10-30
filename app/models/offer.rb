class Offer < ApplicationRecord
  STATES = [
    ACCEPTED = 'accepted'.freeze,
    REJECTED = 'rejected'.freeze
  ].freeze

  belongs_to :order
  belongs_to :responds_to, optional: true
end
