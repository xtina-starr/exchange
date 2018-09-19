module Errors
  class ApplicationError < StandardError
    attr_reader :type, :code, :data
    def initialize(type, code, data = nil)
      raise "Invalid type: #{type} or #{code}. Make sure to add/reuse codes in error_types.rb" unless ERROR_TYPES[type].include?(code)
      @type = type
      @code = code
      @data = data
      super(type)
    end
  end
end
