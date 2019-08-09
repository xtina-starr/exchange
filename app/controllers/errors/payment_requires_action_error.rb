module Errors
  class PaymentRequiresActionError < ProcessingError
    attr_reader :action_data
    def initialize(action_data)
      @action_data = action_data
      super(:payment_requires_action, @action_data)
    end
  end
end
