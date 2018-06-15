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
    raise GraphQL::ExecutionError, 'permission error' unless order.user_id == context[:current_user][:id] || context[:current_user][:partner_ids].include?(order.partner_id)
    order
  end

  def orders(params)
    raise GraphQL::ExecutionError, 'requires one of userId or partnerId' unless params[:user_id].present? || params[:partner_id].present?
    raise GraphQL::ExecutionError, 'Not permitted' if params[:user_id] && params[:user_id] != context[:current_user][:id]
    raise GraphQL::ExecutionError, 'Not permitted' if params[:partner_id] && !context[:current_user][:partner_ids].include?(params[:partner_id])
    Order.where(params)
  end
end
