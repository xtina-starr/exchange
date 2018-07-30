class Types::OrderStateEnum < Types::BaseEnum
  value 'ABANDONED', 'order is abandoned by collector and never submitted', value: Order::ABANDONED
  value 'PENDING', 'order is still pending submission by collector', value: Order::PENDING
  value 'SUBMITTED', 'order is submitted by collector', value: Order::SUBMITTED
  value 'APPROVED', 'order is approved by partner', value: Order::APPROVED
  value 'REJECTED', 'order is rejected by partner', value: Order::REJECTED
  value 'FULFILLED', 'order is fulfilled by partner', value: Order::FULFILLED
end
