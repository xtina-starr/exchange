class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :order, Types::OrderType, null: true do
    description 'Find an order by ID'
    argument :id, ID, required: true
  end

  field :orders, Types::OrderType.connection_type, null: true do
    description 'Find list of orders'
    argument :user_id, String, required: false
    argument :partner_id, String, required: false
    argument :state, Types::OrderStateEnum, required: false
    argument :sort, Types::OrderConnectionSortEnum, required: false
  end

  def order(id:)
    order = Order.find(id)
    raise GraphQL::ExecutionError, 'Not permitted' unless order.user_id == context[:current_user][:id] || context[:current_user][:partner_ids].include?(order.partner_id)
    order
  end

  def orders(params)
    validate_orders_params!(params)
    sort = params.delete(:sort)
    query = Order.where(params)

    case sort
    when 'UPDATED_AT_ASC'
      query.order(updated_at: :asc)
    when 'UPDATED_AT_DESC'
      query.order(updated_at: :desc)
    else
      query
    end
  end

  private

  def validate_orders_params!(params)
    raise GraphQL::ExecutionError, 'requires one of userId or partnerId' unless params[:user_id].present? || params[:partner_id].present?
    raise GraphQL::ExecutionError, 'Not permitted' if params[:user_id] && params[:user_id] != context[:current_user][:id] || !context[:current_user][:roles].include?('trusted')
    raise GraphQL::ExecutionError, 'Not permitted' if params[:partner_id] && !context[:current_user][:partner_ids].include?(params[:partner_id])
  end
end
