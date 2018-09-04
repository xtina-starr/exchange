class Mutations::SetShipping < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :fulfillment_type, Types::OrderFulfillmentTypeEnum, required: true
  argument :phone_number, String, required: false
  argument :shipping, Inputs::ShippingAttributes, required: false

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(id:, fulfillment_type:, phone_number:, shipping: {})
    order = Order.find(id)
    validate_buyer_request!(order)

    raise Errors::AuthError, 'Phone number is required' if fulfillment_type == Order::SHIP && phone_number.nil?

    shipping = AddressParser.parse!(shipping.to_h) if fulfillment_type == Order::SHIP
    {
      order_or_error: { order: OrderService.set_shipping!(order, fulfillment_type: fulfillment_type, phone_number: phone_number, shipping: shipping) }
    }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::MutationErrorType.from_application(e) } }
  end
end
