class Mutations::BuyerOffer < Mutations::BaseMutation
  null true

  argument :order_id, ID, required: true
  argument :amount_cents, Integer, required: true

  field :object_or_error, Mutations::ObjectOrErrorUnionType, 'A union of object/error', null: false

  def resolve(order_id:, amount_cents:)
    order = Order.find(order_id)
    validate_buyer_request!(order)
    Offers::BuyerCreateService.new(order, amount_cents, context[:current_user]['id']).process!
    result = { object_or_error: order.reload }
    result
  rescue Errors::ApplicationError => application_error
    { object_or_error: application_error }
  end
end
