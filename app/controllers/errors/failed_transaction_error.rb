module Errors
  class FailedTransactionError < ProcessingError
    attr_reader :transaction

    def initialize(code, transaction)
      @transaction = transaction
      super(code, transaction.failure_data)
    end
  end
end
