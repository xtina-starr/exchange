module Errors
  class InsufficientInventoryError < ProcessingError
    def initialize(line_item_id = nil)
      super(:insufficient_inventory, line_item_id: line_item_id)
    end
  end
end
