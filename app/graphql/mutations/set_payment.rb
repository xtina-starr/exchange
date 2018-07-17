class Mutations::SetPayment < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :credit_card_id, String, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(args)
    order = Order.find(args[:id])
    assert_order_can_set_payment!(order, args)
    {
      order: OrderService.set_payment!(order, args.except(:id)),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end

  def assert_order_can_set_payment!(order, args)
    raise Errors::AuthError, 'Not permitted' unless context[:current_user]['id'] == order.user_id
  end
end
