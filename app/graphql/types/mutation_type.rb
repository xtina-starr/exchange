class Types::MutationType < Types::BaseObject
  field :create_order, mutation: Mutations::CreateOrder
  field :submit_order, mutation: Mutations::SubmitOrder
  field :approve_order, mutation: Mutations::ApproveOrder
end
