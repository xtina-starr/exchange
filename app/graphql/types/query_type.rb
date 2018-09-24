class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :order, Types::OrderType, null: true do
    description 'Find an order by ID'
    argument :id, ID, required: true
  end

  field :orders, Types::OrderConnectionWithTotalCountType, null: true, connection: true do
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
    validate_order_request!(order)
    order
  end

  def orders(params)
    validate_orders_request!(params)
    sort = params.delete(:sort)
    query = Order.where(params)

    case sort
    when 'UPDATED_AT_ASC'
      query.order(updated_at: :asc)
    when 'UPDATED_AT_DESC'
      query.order(updated_at: :desc)
    when 'STATE_UPDATED_AT_ASC'
      query.order(state_updated_at: :asc)
    when 'STATE_UPDATED_AT_DESC'
      query.order(state_updated_at: :desc)
    else
      query
    end
  end

  private

  def trusted?
    context[:current_user][:roles].include?('trusted')
  end

  def sales_admin?
    context[:current_user][:roles].include?('sales_admin')
  end

  def validate_order_request!(order)
    return if trusted? || sales_admin? ||
              (order.buyer_type == Order::USER && order.buyer_id == context[:current_user][:id]) ||
              (order.seller_type == Order::PARTNER && context[:current_user][:partner_ids].include?(order.seller_id))

    raise Errors::AuthError, :not_found
  end

  def validate_orders_request!(params)
    return if trusted? || sales_admin?

    if params[:buyer_id].present?
      raise Errors::AuthError, :not_found unless params[:buyer_id] == context[:current_user][:id]
    elsif params[:seller_id].present?
      raise Errors::AuthError, :not_found unless context[:current_user][:partner_ids].include?(params[:seller_id])
    else
      raise Errors::ValidationError, :missing_params
    end
  end
end
