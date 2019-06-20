# typed: true
module Errors
  class ProcessingError < ApplicationError
    def initialize(code, data = nil, post_event = false)
      super(:processing, code, data, post_event)
    end
  end
end
