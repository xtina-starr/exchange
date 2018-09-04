class Order < ApplicationRecord
  has_paper_trail
  SUPPORTED_CURRENCIES = %w[usd].freeze
  # For more docs about states go to:
  # https://www.notion.so/artsy/37c311363ef046c3aa546047e60cc58a?v=de68d5bbc30748f88b0d92a059bc0ba8
  STATES = [
    PENDING = 'pending'.freeze,
    # Buyer starts checkout flow but never submits
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
    # Seller didn't approve order in time
    SELLER_LAPSED = 'seller_lapsed'.freeze,
    FULFILLED = 'fulfilled'.freeze
  ].freeze

  STATE_EXPIRATIONS = {
    'pending' => 2.days,
    'submitted' => 2.days,
    'approved' => 7.days
  }.freeze

  FULFILLMENT_TYPES = [
    PICKUP = 'pickup'.freeze,
    SHIP = 'ship'.freeze
  ].freeze

  ACTIONS = %i[abandon submit approve reject fulfill seller_lapse].freeze
  PARTY_TYPES = [
    USER = 'user'.freeze,
    PARTNER = 'partner'.freeze
  ].freeze

  has_many :line_items, dependent: :destroy, class_name: 'LineItem'
  has_many :transactions, dependent: :destroy
  has_many :state_histories, dependent: :destroy

  validates :state, presence: true, inclusion: STATES

  after_create :set_code
  after_create :create_state_history
  before_save :update_state_timestamps, if: :state_changed?
  before_save :set_currency_code

  scope :pending, -> { where(state: PENDING) }
  scope :active, -> { where(state: [SUBMITTED, APPROVED]) }

  ACTIONS.each do |action|
    define_method "#{action}!" do |&block|
      with_lock do
        state_machine.trigger!(action)
        save!
        create_state_history
        block.call if block.present?
        self
      end
    rescue MicroMachine::InvalidState
      raise Errors::OrderError, "Invalid action on this #{state} order"
    end
  end

  def shipping_info?
    fulfillment_type == PICKUP ||
      (fulfillment_type == SHIP && complete_shipping_details?)
  end

  def payment_info?
    credit_card_id.present?
  end

  def to_s
    "Order #{id}"
  end

  def last_submitted_at
    get_last_state_timestamp(Order::SUBMITTED)
  end

  def last_approved_at
    get_last_state_timestamp(Order::APPROVED)
  end

  private

  def set_code
    update!(code: format('B%06d', id))
  end

  def update_state_timestamps
    self.state_updated_at = Time.now.utc
    self.state_expires_at = STATE_EXPIRATIONS.key?(state) ? state_updated_at + STATE_EXPIRATIONS[state] : nil
  end

  def get_last_state_timestamp(state)
    state_histories.where(state: state).order(:updated_at).last&.updated_at
  end

  def create_state_history
    state_histories.create!(state: state, updated_at: state_updated_at)
  end

  def set_currency_code
    self.currency_code ||= 'usd'
  end

  def state_machine
    @state_machine ||= build_machine
  end

  def build_machine
    machine = MicroMachine.new(state)
    machine.when(:abandon, PENDING => ABANDONED)
    machine.when(:submit, PENDING => SUBMITTED)
    machine.when(:approve, SUBMITTED => APPROVED)
    machine.when(:reject, SUBMITTED => REJECTED)
    machine.when(:seller_lapse, SUBMITTED => SELLER_LAPSED)
    machine.when(:fulfill, APPROVED => FULFILLED)
    machine.on(:any) do
      self.state = machine.state
    end
    machine
  end

  def complete_shipping_details?
    [shipping_name, shipping_address_line1, shipping_city, shipping_country, shipping_postal_code, buyer_phone_number].all?(&:present?)
  end
end
