module OrderValidator
  def self.validate_is_last_offer!(offer)
    raise Errors::ValidationError, :not_last_offer unless offer.last_offer?
  end

  def self.validate_order_submitted!(order)
    raise Errors::ValidationError, :invalid_state unless order.state == Order::SUBMITTED
  end

  def self.validate_owner!(offer, from_id)
    raise Errors::ValidationError, :not_offerable unless offer.from_id == from_id
  end

  def self.validate_artwork_versions!(order)
    order.line_items.each do |li|
      artwork = GravityService.get_artwork(li[:artwork_id])
      if artwork[:current_version_id] != li[:artwork_version_id]
        Exchange.dogstatsd.increment 'submit.artwork_version_mismatch'
        raise Errors::ProcessingError, :artwork_version_mismatch
      end
    end
  end

  def self.validate_commission_rate!(partner)
    raise Errors::ValidationError.new(:missing_commission_rate, partner_id: partner[:id]) if partner[:effective_commission_rate].blank?
  end

  def self.validate_credit_card!(credit_card)
    error_type = nil
    error_type = :credit_card_missing_external_id if credit_card[:external_id].blank?
    error_type = :credit_card_missing_customer if credit_card.dig(:customer_account, :external_id).blank?
    error_type = :credit_card_deactivated unless credit_card[:deactivated_at].nil?
    raise Errors::ValidationError.new(error_type, credit_card_id: credit_card[:id]) if error_type
  end
end
