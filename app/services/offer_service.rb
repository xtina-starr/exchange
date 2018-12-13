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
    order_data = OrderData.new(order)
    order.with_lock do
      offer.update!(submitted_at: Time.now.utc)
      order.line_items.first.update!(sales_tax_cents: offer.tax_total_cents, should_remit_sales_tax: offer.should_remit_sales_tax, commission_fee_cents: offer.amount_cents * order_data.commission_rate)
      order_calculator = OrderCalculator.new(line_items: order.line_items, shipping_total_cents: offer.shipping_total_cents, tax_total_cents: offer.tax_total_cents, commission_rate: order_data.commission_rate)
      order.update!(
        last_offer: offer,
        shipping_total_cents: offer.shipping_total_cents,
        tax_total_cents: offer.tax_total_cents,
        commission_rate: order_data.commission_rate,
        items_total_cents: order_calculator.items_total_cents,
        buyer_total_cents: order_calculator.buyer_total_cents,
        commission_fee_cents: order_calculator.commission_fee_cents,
        transaction_fee_cents: order_calculator.transaction_fee_cents,
        seller_total_cents: order_calculator.seller_total_cents
      )
    end
    Exchange.dogstatsd.increment 'offer.submit'
    offer
  end
end
