class Mutations::SubmitOrder < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :order_or_error, Mutations::OrderOrFailureUnionType, 'A union of success/failure', null: false

  def resolve(id:)
    order = Order.find(id)
    validate_buyer_request!(order)
    { order_or_error: { order: OrderSubmitService.call!(order, by: context[:current_user]['id'], user_agent: context[:user_agent]) } }
  rescue Errors::ApplicationError => e
    { order_or_error: { error: Types::ApplicationErrorType.from_application(e) } }
  end
end
