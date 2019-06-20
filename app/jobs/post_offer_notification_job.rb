# typed: false
class PostOfferNotificationJob < ApplicationJob
  queue_as :default

  def perform(offer_id, action, user_id = nil)
    offer = Offer.find(offer_id)
    OfferEvent.post(offer, action, user_id)
  end
end
