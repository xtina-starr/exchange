# typed: true
module Errors
  class ValidationError < ApplicationError
    def initialize(code, data = nil, post_event = false)
      super(:validation, code, data, post_event)
    end
  end
end
