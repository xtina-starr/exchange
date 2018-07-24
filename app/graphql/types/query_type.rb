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
    raise GraphQL::ExecutionError, 'Not permitted' unless trusted? || user_permitted?(order.user_id) || partner_permitted?(order.partner_id)
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

  def user_permitted?(id)
    trusted? || id == context[:current_user][:id]
  end

  def partner_permitted?(id)
    trusted? || context[:current_user][:partner_ids].include?(id)
  end

  def validate_user(id)
    raise GraphQL::ExecutionError, 'Not permitted' unless user_permitted?(id)
  end

  def validate_partner(id)
    raise GraphQL::ExecutionError, 'Not permitted' unless partner_permitted?(id)
  end

  def validate_orders_params!(params)
    if params[:user_id].present?
      validate_user(params[:user_id])
    elsif params[:partner_id].present?
      validate_partner(params[:partner_id])
    else
      raise GraphQL::ExecutionError, 'requires one of userId or partnerId'
    end
  end
end
