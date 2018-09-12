module Errors
  class ApplicationError < StandardError
    attr_reader :type, :code, :message
    def initialize(message, type, code)
      @type = type
      @code = code
      super(message)
    end
  end
end
