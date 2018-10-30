class Offer < ApplicationRecord
  STATES = [
    ACCEPTED = 'accepted'.freeze,
    REJECTED = 'rejected'.freeze
  ].freeze

  belongs_to :order
end
