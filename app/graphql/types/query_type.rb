class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :order, Types::OrderInterface, null: true do
    description 'Find an order by ID'
    argument :id, ID, required: false
    argument :code, String, required: false
  end

  field :orders, Types::OrderConnectionWithTotalCountType, null: true, connection: true do
    description 'Find list of orders'
    argument :seller_id, String, required: false
    argument :seller_type, String, required: false
    argument :buyer_id, String, required: false
    argument :buyer_type, String, required: false
    argument :state, Types::OrderStateEnum, required: false
    argument :sort, Types::OrderConnectionSortEnum, required: false
    argument :mode, Types::OrderModeEnum, required: false
  end

  def order(args)
    raise Error::ValidationError.new(:missing_required_param, message: 'id or code is required') unless args[:id].present? || args[:code].present?

    order = Order.find_by!(args)
    validate_order_request!(order)
    order
  end

  def orders(params = {})
    validate_orders_request!(params)
    sort = params.delete(:sort)
    order_clause = sort_to_order[sort] || {}
    Order.where(params).order(order_clause)
  end

  private

  def sort_to_order
    {
      'UPDATED_AT_ASC' => { updated_at: :asc },
      'UPDATED_AT_DESC' => { updated_at: :desc },
      'STATE_UPDATED_AT_ASC' => { state_updated_at: :asc },
      'STATE_UPDATED_AT_DESC' => { state_updated_at: :desc },
      'STATE_EXPIRES_AT_ASC' => { state_expires_at: :asc },
      'STATE_EXPIRES_AT_DESC' => { state_expires_at: :desc }
    }
  end

  def trusted?
    context[:current_user][:roles].include?('trusted')
  end

  def validate_order_request!(order)
    return if trusted? ||
              (order.buyer_type == Order::USER && order.buyer_id == context[:current_user][:id]) ||
              (order.seller_type != Order::USER && context[:current_user][:partner_ids].include?(order.seller_id))

    raise ActiveRecord::RecordNotFound
  end

  def validate_orders_request!(params)
    return if trusted?

    if params[:buyer_id].present?
      raise ActiveRecord::RecordNotFound unless params[:buyer_id] == context[:current_user][:id]
    elsif params[:seller_id].present?
      raise ActiveRecord::RecordNotFound unless context[:current_user][:partner_ids].include?(params[:seller_id])
    else
      raise Errors::ValidationError, :missing_params
    end
  end
end
