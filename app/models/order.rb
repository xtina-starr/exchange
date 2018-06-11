class Order < ApplicationRecord
  STATES = [
    PENDING = 'pending',
    SUBMITTED = 'submitted'
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
