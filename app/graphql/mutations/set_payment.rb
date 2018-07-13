class Mutations::SetPayment < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :credit_card_id, String, required: false
  argument :merchant_account_id, String, required: false

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
    raise Errors::ApplicationError, 'Missing required arguments' unless args[:merchant_account_id].present? || args[:credit_card_id].present?
    raise Errors::AuthError, 'Not permitted' unless context[:current_user]['id'] == order.user_id
  end
end
