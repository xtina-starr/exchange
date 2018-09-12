module Errors
  class ValidationError < ApplicationError
    def initialize(message, code)
      super(message, :validation, code)
    end
  end
end
