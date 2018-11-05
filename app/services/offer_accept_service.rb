class OfferAcceptService
  def initialize(offer)
    @offer = offer
  end

  def process!
    @offer.order.approve!
    instrument_order_approved
  end

  private

  def instrument_order_approved
    Exchange.dogstatsd.increment 'order.approve'
  end
end
