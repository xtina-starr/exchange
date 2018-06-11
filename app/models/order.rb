class Order < ApplicationRecord
  STATES = [
    PENDING = 'pending',
    ABANDONED = 'abandoned',
    # Check-out complete; payment authorized.
    # Buyer credit card has been authorized and hold has been placed.
    # At this point, availability must be confirmed manually.
    # Holds expire 7 days after being placed.
    SUBMITTED = 'submitted',
    # Availability has been manually confirmed and hold has been "captured" (debited).
    APPROVED = 'approved',
    # Items have been deemed unavailable and hold is voided.
    REJECTED = 'rejected'
  ]

  has_many :line_items, class_name: 'LineItem'

  validates :state, inclusion: { in: STATES }

  before_create :set_code
  before_save :set_currency_code

  scope :pending, -> { where(state: PENDING) }

  private

  def set_code
    self.code = SecureRandom.hex(10)
  end

  def set_currency_code
    self.currency_code ||= 'usd'
  end
end
