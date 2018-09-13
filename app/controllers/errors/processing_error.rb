module Errors
  class ProcessingError < ApplicationError
    def initialize(code, data = {})
      super(:processing, code, data)
    end
  end
end
