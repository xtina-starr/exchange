class Mutations::SubmitOrder < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :shipping_info, String, required: false
  argument :credit_card_id, String, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(id:, shipping_info:, credit_card_id:)
    order = Order.find(id)
    validate_request!(order)
    {
      order: OrderService.submit!(order, credit_card_id: credit_card_id, shipping_info: shipping_info),
      errors: [],
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end

  def validate_request!(order)
    raise Errors::AuthError.new('Not permitted') unless context[:current_user]['partner_ids'].include?(order.partner_id)
  end
end