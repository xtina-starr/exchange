class Order < ApplicationRecord
  STATES = [
    PENDING = 'pending'.freeze,
    ABANDONED = 'abandoned'.freeze,
    # Check-out complete; payment authorized.
    # Buyer credit card has been authorized and hold has been placed.
    # At this point, availability must be confirmed manually.
    # Holds expire 7 days after being placed.
    SUBMITTED = 'submitted'.freeze,
    # Availability has been manually confirmed and hold has been "captured" (debited).
    APPROVED = 'approved'.freeze,
    # Items have been deemed unavailable and hold is voided.
    REJECTED = 'rejected'.freeze,

    FINALIZED = 'finalized'.freeze
  ]
  ACTIONS = %i[submit approve reject finalize]

  has_many :line_items, dependent: :destroy, class_name: 'LineItem'

  validates :state, presence: true, inclusion: STATES

  before_create :set_code
  before_save :set_currency_code

  scope :pending, -> { where(state: PENDING) }

  ACTIONS.each do |action|
    define_method "#{action}!" do
      state_machine.trigger!(action)
    rescue MicroMachine::InvalidState => e
      raise Errors::OrderError.new("Invalid action on this #{self.state} order")
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
    machine.when(:submit, PENDING => SUBMITTED)
    machine.when(:approve, SUBMITTED => APPROVED)
    machine.when(:reject, SUBMITTED => REJECTED)
    machine.when(:finalize, APPROVED => FINALIZED)
    machine.on(:any) do |new_state, _payload|
      self.state = machine.state
    end
    machine
  end
end
