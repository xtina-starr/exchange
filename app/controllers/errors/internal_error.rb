# typed: true
module Errors
  class InternalError < ApplicationError
    def initialize(code, data = nil)
      super(:internal, code, data)
    end
  end
end
