class Mutations::CreateOrder < Mutations::BaseMutation
  null true

  argument :partner_id, String, required: true
  argument :currency_code, String, required: true

  argument :line_items, [Types::LineItemAttributes], required: false

  field :order, Types::OrderType, null: true
  field :errors, [String], null: false

  def resolve(partner_id:, currency_code:, line_items: [])
    {
      order: OrderService.create!(user_id: context[:current_user][:id], partner_id: partner_id, currency_code: currency_code, line_items: line_items),
      errors: []
    }
  rescue Errors::ApplicationError => e
    { order: nil, errors: [e.message] }
  end
end
