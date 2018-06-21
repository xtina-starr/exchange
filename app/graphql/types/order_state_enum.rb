class Types::OrderStateEnum < Types::BaseEnum
  value 'PENDING', 'order is still pending submission by collector', value: 'pending'
  value 'SUBMITTED', 'order is submitted by collector', value: 'submitted'
  value 'APPROVED', 'order is approved by partner', value: 'approved'
  value 'REJECTED', 'order is rejected by partner', value: 'rejected'
  value 'FINALIZED', 'order is finalized by partner', value: 'finalized'
end
