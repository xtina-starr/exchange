class Types::OrderStateEnum < Types::BaseEnum
  value 'ABANDONED', 'order is abandoned by collector and never submitted', value: Order::ABANDONED
  value 'PENDING', 'order is still pending submission by collector', value: Order::PENDING
  value 'SUBMITTED', 'order is submitted by collector', value: Order::SUBMITTED
  value 'APPROVED', 'order is approved by seller', value: Order::APPROVED
  value 'CANCELED', 'order is canceled by seller', value: Order::CANCELED
  value 'FULFILLED', 'order is fulfilled by seller', value: Order::FULFILLED
end
