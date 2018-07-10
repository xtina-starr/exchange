class Types::OrderShippingTypeEnum < Types::BaseEnum
  value 'PICKUP', 'order will be picked up by collector', value: Order::PICKUP
  value 'SHIP', 'order will be shipped to collector', value: Order::SHIP
end
