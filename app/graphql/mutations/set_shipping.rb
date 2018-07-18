class Mutations::SetShipping < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :shipping_address_line1, String, required: false
  argument :shipping_address_line2, String, required: false
  argument :shipping_city, String, required: false
  argument :shipping_region, String, required: false
  argument :shipping_country, String, required: false
  argument :shipping_postal_code, String, required: false
  argument :fulfillment_type, Types::OrderFulfillmentTypeEnum, required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(args)
    order = Order.find(args[:id])
    assert_order_can_set_shipping!(order)
    {
      order: OrderService.set_shipping!(order, args.except(:id)),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end

  def assert_order_can_set_shipping!(order)
    raise Errors::AuthError, 'Not permitted' unless context[:current_user]['id'] == order.user_id
  end
end
