class Types::MutationType < Types::BaseObject
  field :create_order, mutation: Mutations::CreateOrder
  field :update_order, mutation: Mutations::UpdateOrder
  field :submit_order, mutation: Mutations::SubmitOrder
  field :approve_order, mutation: Mutations::ApproveOrder
  field :reject_order, mutation: Mutations::RejectOrder
  field :finalize_order, mutation: Mutations::FinalizeOrder
end
