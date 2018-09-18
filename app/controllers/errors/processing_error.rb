module Errors
  class ProcessingError < ApplicationError
    def initialize(code, data = nil)
      super(:processing, code, data)
    end
  end
end
