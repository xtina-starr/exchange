class Mutations::RejectOrder < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    order = Order.find(id)
    validate_seller_request!(order)
    {
      order: OrderService.reject!(order, context[:current_user][:id]),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end
end
