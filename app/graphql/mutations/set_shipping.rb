class Mutations::SetShipping < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :shipping_name, String, required: false
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
    validate_buyer_request!(order)
    {
      order: OrderService.set_shipping!(order, args.except(:id)),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end
end
