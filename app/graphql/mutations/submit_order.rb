class Mutations::SubmitOrder < Mutations::BaseMutation
  null true

  argument :id, String, required: true
  argument :shipping_info, String, required: false
  argument :credit_card_id, String, required: true

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(id:, shipping_info:, credit_card_id:)
    order = Order.find(id)
    validate_request!(order)
    {
      order: OrderService.submit!(order, user_id: user_id, partner_id: partner_id, currency_code: currency_code, line_items: line_items),
      errors: [],
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end

  def validate_user!(user_id)
    raise Errors::AuthError.new('Not permitted') unless context[:current_user]['partner_ids'].include?(order.partner_id)
  end
end