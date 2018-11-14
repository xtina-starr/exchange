class Mutations::AddOfferToPendingOrder < Mutations::BaseMutation
  null true

  argument :order_id, ID, required: true
  argument :amount_cents, Integer, required: true

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(order_id:, amount_cents:)
    order = Order.find(order_id)
    authorize_buyer_request!(order)
    service = Offers::InitialOfferService.new(order, amount_cents, context[:current_user]['id'])
    service.process!
    { order_or_error: { order: service.order } }
  rescue Errors::ApplicationError => application_error
    { order_or_error: { error: Types::ApplicationErrorType.from_application(application_error) } }
  end
end
