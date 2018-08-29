class Mutations::SetShipping < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :fulfillment_type, Types::OrderFulfillmentTypeEnum, required: false
  argument :shipping, Inputs::ShippingAttributes, required: false

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
