class Mutations::SetPayment < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :credit_card_id, String, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(args)
    order = Order.find(args[:id])
    validate_buyer_request!(order)
    {
      order: OrderService.set_payment!(order, args.except(:id)),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end
end
