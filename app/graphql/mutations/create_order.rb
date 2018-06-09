class Mutations::CreateOrder < Mutations::BaseMutation
  null true

  argument :user_id, String, required: true
  argument :partner_id, String, required: true

  argument :line_items, [Types::LineItemAttributes], required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(user_id:, partner_id:, line_items: [])
    return { order: nil, errors: ['Not Permitted'] } unless valid_user?(user_id)
    return { order: nil, errors: ['Existing pending order']} if has_pending_orders?(user_id, line_items)
    order = OrderService.create!(user_id: user_id, partner_id: partner_id, line_items: line_items)
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
end