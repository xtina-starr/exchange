class Types::OrderStateEnum < Types::BaseEnum
  value 'PENDING', 'order is still pending submission by collector', value: Order::PENDING
  value 'SUBMITTED', 'order is submitted by collector', value: Order::SUBMITTED
  value 'APPROVED', 'order is approved by partner', value: Order::APPROVED
  value 'REJECTED', 'order is rejected by partner', value: Order::REJECTED
  value 'FINALIZED', 'order is finalized by partner', value: Order::FINALIZED
end
