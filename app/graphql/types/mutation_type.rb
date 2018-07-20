class Types::MutationType < Types::BaseObject
  field :create_order_with_artwork, mutation: Mutations::CreateOrderWithArtwork
  field :set_shipping, mutation: Mutations::SetShipping
  field :set_payment, mutation: Mutations::SetPayment
  field :submit_order, mutation: Mutations::SubmitOrder
  field :approve_order, mutation: Mutations::ApproveOrder
  field :reject_order, mutation: Mutations::RejectOrder
  field :finalize_order, mutation: Mutations::FinalizeOrder
end
