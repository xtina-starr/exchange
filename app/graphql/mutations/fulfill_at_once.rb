class Mutations::FulfillAtOnce < Mutations::BaseMutation
  null true
  description 'Fulfill an order with one Fulfillment, it sets this fulfillment to each line item in order'

  argument :id, ID, required: true
  argument :fulfillment, Types::FulfillmentAttributes, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(id:, fulfillment:)
    order = Order.find(id)
    validate_seller_request!(order)
    {
      order: OrderService.fulfill_at_once!(order, fulfillment.to_h, context[:current_user][:id]),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end
end
