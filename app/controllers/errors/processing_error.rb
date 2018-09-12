module Errors
  class ProcessingError < ApplicationError
    def initialize(message, code)
      super(message, :processing, code)
    end
  end
end
