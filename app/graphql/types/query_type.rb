class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :order, Types::OrderType, null: false do
    description "Find an order by ID"
    argument :id, ID, required: true
  end

  field :orders, [Types::OrderType], null: true do
    description "Find list of orders"
    argument :user_id, String, required: false
    argument :partner_id, String, required: false
    argument :state, String, required: false
  end

  def order(id:)
    order = Order.find(id)
    raise GraphQL::ExecutionError, 'permission error' unless order.user_id == context[:current_user][:id]
    order
  end
end
