module Errors
  class PaymentError < ApplicationError
    attr_reader :message, :body
    def initialize(message, body=nil)
      @message = message
      @body = body
    end
  end
end
