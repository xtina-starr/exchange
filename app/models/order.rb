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
    REJECTED = 'rejected',

    FINALIZED = 'finalized'
  ]

  has_many :line_items, class_name: 'LineItem'

  validates :state, presence: true, inclusion: STATES

  before_create :set_code
  before_save :set_currency_code

  scope :pending, -> { where(state: PENDING) }

  STATES.each do |state|
    define_method "#{state}!" do
      state_machine.trigger!(state)
    rescue MicroMachine::InvalidState => e
      raise Errors::OrderError.new("Order cannot be #{state}")
    end
  end

  private

  def set_code
    self.code = SecureRandom.hex(10)
  end

  def set_currency_code
    self.currency_code ||= 'usd'
  end

  def state_machine
    @state_machine ||= build_machine
  end

  def build_machine
    machine = MicroMachine.new(self.state)
    machine.when(SUBMITTED, PENDING => SUBMITTED)
    machine.when(APPROVED, SUBMITTED => APPROVED)
    machine.when(REJECTED, SUBMITTED => REJECTED)
    machine.when(FINALIZED, APPROVED => FINALIZED)
    machine.on(:any) do |new_state, _payload|
      update_state(new_state)
    end
    machine
  end

  def update_state(new_state)
    self.state = new_state
  end
end
