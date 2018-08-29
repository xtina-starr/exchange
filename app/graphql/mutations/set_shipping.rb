class Mutations::SetShipping < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :fulfillment_type, Types::OrderFulfillmentTypeEnum, required: false
  argument :shipping, Inputs::ShippingAttributes, required: false

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(args)
    order = Order.find(args[:id])
    validate_buyer_request!(order)
    {
      order_or_error: { order: OrderService.set_shipping!(order, args.except(:id)) }
    }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::MutationErrorType.from_application(e) } }
  end
end
