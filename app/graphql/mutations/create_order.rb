class Mutations::CreateOrder < Mutations::BaseMutation
  null true

  argument :user_id, String, required: true
  argument :partner_id, String, required: true
  argument :currency_code, String, required: true

  argument :line_items, [Types::LineItemAttributes], required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(user_id:, partner_id:, currency_code:, line_items: [])
    errors = []
    errors << 'Not permitted' unless valid_user?(user_id)
    errors << 'Existing pending order' if has_pending_orders?(user_id, line_items)
    errors << 'Currency not suppoerted' unless valid_currency_code?(currency_code)
    return { order: nil, errors: errors} if errors.any?
    order = OrderService.create!(user_id: user_id, partner_id: partner_id, currency_code: currency_code, line_items: line_items)
    {
      order: order,
      errors: [],
    }
  end

  def valid_user?(user_id)
    context[:current_user]['id'] == user_id
  end

  def has_pending_orders?(user_id, line_items)
    OrderService.create_params_has_pending_order?(user_id, line_items)
  end

  def valid_currency_code?(currency_code)
    currency_code == 'usd'
  end
end
