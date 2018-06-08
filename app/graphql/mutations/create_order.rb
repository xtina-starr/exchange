class Mutations::CreateOrder < Mutations::BaseMutation
  null true

  argument :user_id, String, required: true
  argument :partner_id, String, required: true

  argument :line_items, [Types::LineItemAttributes], required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(user_id:, partner_id:, line_items: [])
    return { order: nil, errors: ['Not Permitted.'] } if context[:current_user]['id'] != user_id
    return { order: nil, errors: ['Existing pending order']} if OrderService.create_params_has_pending_order?(user_id: user_id, line_items: line_items)
    order = OrderService.create!(user_id: user_id, partner_id: partner_id, line_items: line_items)
    # Successful creation, return the created object with no errors
    {
      order: order,
      errors: [],
    }
  end
end