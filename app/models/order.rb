class Order < ApplicationRecord
  include ActiveModel::Serializers::JSON

  STATES = [
    PENDING = 'pending',
    SUBMITTED = 'submitted'
  ]

  has_many :line_items, class_name: 'LineItem'

  validates :state, inclusion: { in: STATES }

  before_create :set_code
  before_save :set_last_state_change, if: :state_changed?

  scope :pending, -> { where(state: PENDING) }

  private

  def set_code
    self.code = SecureRandom.hex(10)
  end

  def set_last_state_change
    self.last_state_change_at = Time.now.utc
  end

  def attributes
    {
      id: nil,
      code: nil,
      user_id: nil,
      partner_id: nil,
      state: nil,
      last_state_change_at: nil,
      created_at: nil
    }
  end
end
