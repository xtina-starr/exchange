class Types::MutationType < Types::BaseObject
  # Buyer
  field :create_order_with_artwork, mutation: Mutations::CreateOrderWithArtwork
  field :create_offer_order_with_artwork, mutation: Mutations::Offers::CreateOfferOrderWithArtwork
  field :set_shipping, mutation: Mutations::SetShipping
  field :set_payment, mutation: Mutations::SetPayment
  field :submit_order, mutation: Mutations::SubmitOrder
  field :buyer_accept_offer, mutation: Mutations::Offers::BuyerAcceptOffer
  field :buyer_reject_offer, mutation: Mutations::Offers::BuyerRejectOffer
  field :add_initial_offer_to_order, mutation: Mutations::Offers::AddInitialOfferToOrder
  field :submit_order_with_offer, mutation: Mutations::Offers::SubmitOrderWithOffer

  # Seller
  field :approve_order, mutation: Mutations::ApproveOrder
  field :seller_accept_offer, mutation: Mutations::Offers::SellerAcceptOffer
  field :seller_reject_offer, mutation: Mutations::Offers::SellerRejectOffer
  field :seller_counter_offer, mutation: Mutations::Offers::SellerCounterOffer
  field :reject_order, mutation: Mutations::RejectOrder
  field :fulfill_at_once, mutation: Mutations::FulfillAtOnce
  field :confirm_pickup, mutation: Mutations::ConfirmPickup
end
