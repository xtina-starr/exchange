class Mutations::SubmitOrder < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    order = Order.find(id)
    validate_buyer_request!(order)
    {
      order: OrderSubmitService.submit!(order, by: context[:current_user]['id']),
      errors: []
    }
  rescue Errors::ApplicationError, Errors::PaymentError => e
    { order: nil, errors: [e.message] }
  end
end
