class Types::BaseField < GraphQL::Schema::Field
  def initialize(buyer_only: false, seller_only: false, **kwargs, &block)
    @buyer_only = buyer_only
    @seller_only = seller_only
    super(**kwargs, &block)
  end

  def authorized?(obj, ctx)
    case obj
    when Order then order_field_authorized?(obj, ctx[:current_user])
    else
      super
    end
  end

  private

  def order_field_authorized?(obj, current_user)
    return current_user[:id] == obj.buyer_id if @buyer_only
    return current_user[:partner_ids].include?(obj.seller_id) if @seller_only
    true
  end
end
