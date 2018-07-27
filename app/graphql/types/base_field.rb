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
    if @buyer_only && current_user['id'] != obj.user_id
      false
    elsif @seller_only && !current_user[:partner_ids].include?(obj.partner_id)
      false
    else
      true
    end
  end
end
