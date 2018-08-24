class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :order, Types::OrderType, null: true do
    description 'Find an order by ID'
    argument :id, ID, required: true
  end

  field :orders, Types::OrderType.connection_type, null: true do
    description 'Find list of orders'
    argument :seller_id, String, required: false
    argument :seller_type, String, required: false
    argument :buyer_id, String, required: false
    argument :buyer_type, String, required: false
    argument :state, Types::OrderStateEnum, required: false
    argument :sort, Types::OrderConnectionSortEnum, required: false
  end

  def order(id:)
    order = Order.find(id)
    raise GraphQL::ExecutionError, 'Not permitted' unless trusted? || access?(order)
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

  def trusted?
    context[:current_user][:roles].include?('trusted')
  end

  def access?(order)
    context[:current_user][:roles].include?('sales_admin') ||
      (order.buyer_type == 'user' && order.buyer_id == context[:current_user][:id]) ||
      (order.seller_type == 'partner' && context[:current_user][:partner_ids].include?(order.seller_id))
  end

  def validate_orders_params!(params)
    return if trusted?
    if params[:buyer_id].present?
      raise GraphQL::ExecutionError, 'Not permitted' unless params[:buyer_id] == context[:current_user][:id]
    elsif params[:seller_id].present?
      raise GraphQL::ExecutionError, 'Not permitted' unless context[:current_user][:partner_ids].include?(params[:seller_id])
    else
      raise GraphQL::ExecutionError, 'requires one of sellerId or buyerId'
    end
  end
end
