module Errors
  class InventoryError < ApplicationError
    attr_reader :message, :line_item
    def initialize(message, line_item)
      @message = message
      @line_item = line_item
    end
  end
end
