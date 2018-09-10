module Errors
  class PaymentError < ApplicationError
    attr_reader :message, :transaction
    def initialize(message, transaction = nil)
      @message = message
      @transaction = transaction
    end
  end
end
