module OfferService
  def self.create_pending_offer(responds_to, amount_cents:, from_id:, from_type:, creator_id:)
    order = responds_to.order
    raise Errors::ValidationError, :not_last_offer unless responds_to.last_offer?
    raise Errors::ValidationError, :invalid_state unless order.state == Order::SUBMITTED

    offer_calculator = OfferCalculator.new(order, amount_cents)

    order.offers.create!(
      amount_cents: amount_cents,
      from_id: from_id,
      from_type: from_type,
      creator_id: creator_id,
      responds_to: responds_to,
      shipping_total_cents: offer_calculator.shipping_total_cents,
      tax_total_cents: offer_calculator.tax_total_cents,
      should_remit_sales_tax: offer_calculator.should_remit_sales_tax
    )
  end

  def self.submit_pending_offer(offer)
    raise Errors::ValidationError, :invalid_offer if offer.submitted?

    order = offer.order
    offer_calculator = OfferCalculator.new(order, offer.amount_cents)
    order.with_lock do
      offer.update!(submitted_at: Time.now.utc)
      order.line_items.first.update!(sales_tax_cents: offer.tax_total_cents, should_remit_sales_tax: offer.should_remit_sales_tax, commission_fee_cents: offer_calculator.commission_fee_cents)
      order_calculator = OrderCalculator.new(line_items: order.line_items, shipping_total_cents: offer.shipping_total_cents, tax_total_cents: offer.tax_total_cents, commission_rate: offer_calculator.commission_rate)
      order.update!(
        last_offer: offer,
        shipping_total_cents: offer.shipping_total_cents,
        tax_total_cents: offer.tax_total_cents,
        commission_rate: offer_calculator.commission_rate,
        items_total_cents: order_calculator.items_total_cents,
        buyer_total_cents: order_calculator.buyer_total_cents,
        commission_fee_cents: order_calculator.commission_fee_cents,
        transaction_fee_cents: order_calculator.transaction_fee_cents,
        seller_total_cents: order_calculator.seller_total_cents,
        state_expires_at: Offer::EXPIRATION.from_now # expand order expiration
      )
    end
    OrderFollowUpJob.set(wait_until: order.state_expires_at).perform_later(order.id, order.state)
    # We are posting order.submitted event 👇, for now since Pulse (email service) is expecting that in case of submitting pending offer
    # We need to send OfferEvent eventually in this case to be more accurate
    PostOrderNotificationJob.perform_later(order.id, Order::SUBMITTED, offer.creator_id)
    Exchange.dogstatsd.increment 'offer.submit'
    offer
  end
end
