module Errors
  class PaymentRequiresActionError < ProcessingError
    attr_reader :transaction
    def initialize(transaction)
      @transaction = transaction
      super(:payment_requires_action, { client_secret: @transaction.payload[:client_secret] })
    end
  end
end
