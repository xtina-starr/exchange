module Offers
  module OfferValidationService
    def validate_is_last_offer!(offer)
      raise Errors::ValidationError.new(:not_last_offer, offer) unless offer.last_offer?
    end

    def validate_is_not_own_offer!(offer, user_id)
      raise Errors::ValidationError.new(:cannot_reject_offer, offer) if offer.from_id == user_id
    end
  end
end
