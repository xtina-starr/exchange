# typed: strict
class Types::OrderParticipantEnum < Types::BaseEnum
  value 'BUYER', 'Participant on the buyer side', value: Order::BUYER
  value 'SELLER', 'Participant on the seller side', value: Order::SELLER
end
