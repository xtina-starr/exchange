class Types::OrderStateEnum < Types::BaseEnum
  value 'ACCEPTED', 'offer is accepted', value: Offer::ACCEPTED
  value 'REJECTED', 'offer is rejected by either side', value: Offer::REJECTED
end
