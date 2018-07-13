class Types::OrderFulfillmentTypeEnum < Types::BaseEnum
  Order::FULFILLMENT_TYPES.each do |ft|
    value ft.upcase, "fulfillment type is: #{ft}", value: ft
  end
end
