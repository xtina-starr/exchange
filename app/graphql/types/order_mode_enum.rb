class Types::OrderModeEnum < Types::BaseEnum
  value Order::BUY.upcase, 'Buy Order', value: Order::BUY
  value Order::OFFER.upcase, 'Offer Order', value: Order::OFFER
end
