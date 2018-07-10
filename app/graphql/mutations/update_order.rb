class Mutations::UpdateOrder < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :credit_card_id, String, required: false
  argument :shipping_address, String, required: false
  argument :shipping_city, String, required: false
  argument :shipping_country, String, required: false
  argument :shipping_postal_code, String, required: false
  argument :shipping_type, Types::OrderShippingTypeEnum, required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(args)
    order = Order.find(args[:id])
    validate_request!(order)
    {
      order: OrderService.update!(order, args.except(:id)),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end

  def validate_request!(order)
    raise Errors::AuthError, 'Not permitted' unless context[:current_user]['id'] == order.user_id
  end
end
