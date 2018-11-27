module Offers
  class BaseOfferService
    def validate_is_last_offer!
      raise Errors::ValidationError.new(:not_last_offer, offer) unless offer.last_offer?
    end
  end
end
