module Errors
  class ValidationError < ApplicationError
    def initialize(code, data = nil)
      super(:validation, code, data)
    end
  end
end
