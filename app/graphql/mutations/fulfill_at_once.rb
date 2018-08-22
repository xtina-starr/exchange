class Mutations::FulfillAtOnce < Mutations::BaseMutation
  null true
  description 'Fulfill an order with one Fulfillment, it sets this fulfillment to each line item in order'

  argument :id, ID, required: true
  argument :fulfillment, Inputs::FulfillmentAttributes, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(id:, fulfillment:)
    order = Order.find(id)
    validate_request!(order)
    {
      order: OrderService.fulfill_at_once!(order, fulfillment.to_h, context[:current_user][:id]),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end

  def validate_request!(order)
    raise Errors::AuthError, 'Not permitted' unless context[:current_user]['partner_ids'].include?(order.partner_id)
  end
end
