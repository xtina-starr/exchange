module Errors
  class ValidationError < ApplicationError
    def initialize(code, data = {})
      super(:validation, code, data)
    end
  end
end
