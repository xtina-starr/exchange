class Mutations::BaseMutation < GraphQL::Schema::RelayClassicMutation
  private

  def authorize_seller_request!(order)
    raise Errors::ValidationError, :not_found unless authorized_to_sell?(order)
  end

  def authorize_buyer_request!(order)
    raise Errors::ValidationError, :not_found unless authorized_to_buy?(order)
  end

  def authorize_offer_owner_request!(offer)
    raise Errors::ValidationError, :not_found unless context[:current_user]['id'] == offer.from_id && offer.from_type == Order::USER
  end

  def current_user_id
    context[:current_user]['id']
  end

  def authorized_to_sell?(order)
    current_user_is_on_seller = context[:current_user]['partner_ids'].include?(order.seller_id)
    order.seller_type != Order::USER && current_user_is_on_seller
  end

  def authorized_to_buy?(order)
    context[:current_user]['id'] == order.buyer_id
  end
end
