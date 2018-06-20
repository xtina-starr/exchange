class Mutations::CreateOrder < Mutations::BaseMutation
  null true

  argument :user_id, String, required: true
  argument :partner_id, String, required: true
  argument :currency_code, String, required: true

  argument :line_items, [Types::LineItemAttributes], required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(user_id:, partner_id:, currency_code:, line_items: [])
    validate_user!(user_id)
    {
      order: OrderService.create!(user_id: user_id, partner_id: partner_id, currency_code: currency_code, line_items: line_items),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end

  def validate_user!(user_id)
    raise Errors::AuthError, 'Not permitted' if context[:current_user][:id] != user_id
  end
end
