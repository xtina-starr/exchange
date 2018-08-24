class Types::OrderStateEnum < Types::BaseEnum
  value 'ABANDONED', 'order is abandoned by collector and never submitted', value: Order::ABANDONED
  value 'PENDING', 'order is still pending submission by collector', value: Order::PENDING
  value 'SUBMITTED', 'order is submitted by collector', value: Order::SUBMITTED
  value 'APPROVED', 'order is approved by seller', value: Order::APPROVED
  value 'REJECTED', 'order is rejected by seller', value: Order::REJECTED
  value 'FULFILLED', 'order is fulfilled by seller', value: Order::FULFILLED
  value 'SELLER_LAPSED', 'order was lapsed by the seller', value: Order::SELLER_LAPSED
end
