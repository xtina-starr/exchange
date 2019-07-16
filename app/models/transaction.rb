class Transaction < ApplicationRecord
  has_paper_trail versions: { class_name: 'PaperTrail::TransactionVersion' }

  belongs_to :order

  TYPES = [
    HOLD = 'hold'.freeze,
    CAPTURE = 'capture'.freeze,
    REFUND = 'refund'.freeze,
    PAYMENT_INTENT = 'payment_intent'.freeze
  ].freeze

  STATUSES = [
    SUCCESS = 'success'.freeze,
    FAILURE = 'failure'.freeze,
    REQUIRES_ACTION = 'requires_action'.freeze,
    REQUIRES_CAPTURE = 'requires_capture'.freeze
  ].freeze

  def to_s
    failed? ? "#{id}: #{failure_code} - #{failure_message}" : id
  end

  def failed?
    [FAILURE, REQUIRES_ACTION].include?(status)
  end

  def failure_data
    {
      id: id,
      failure_code: failure_code,
      failure_message: failure_message,
      decline_code: decline_code
    }
  end
end
