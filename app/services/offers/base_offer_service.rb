module Offers
  class BaseOfferService
    def validate_is_last_offer!
      raise Errors::ValidationError.new(:not_last_offer, offer) unless offer.last_offer?
    end

    def validate_offer_is_from_buyer!
      raise Errors::ValidationError.new(:offer_not_from_buyer, offer) unless offer.from_type == Order::USER
    end
  end
end
