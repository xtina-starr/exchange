module OrderService
  def self.set_payment!(order, credit_card_id)
    raise Errors::OrderError, 'Cannot set payment info on non-pending orders' unless order.state == Order::PENDING
    order.update!(credit_card_id: credit_card_id)
    order
  end

  def self.set_shipping!(order, fulfillment_type:, phone_number:, shipping: {})
    raise Errors::OrderError, 'Cannot set shipping info on non-pending orders' unless order.state == Order::PENDING
    artworks = Hash[order.line_items.pluck(:artwork_id).uniq.map do |artwork_id|
      artwork = GravityService.get_artwork(artwork_id)
      validate_artwork!(artwork)
      [artwork[:_id], artwork]
    end]
    Order.transaction do
      shipping_total_cents = order.line_items.map { |li| ShippingService.calculate_shipping(artwork: artworks[li.artwork_id], shipping_country: shipping[:country], fulfillment_type: fulfillment_type) }.sum
      attrs = {
        shipping_total_cents: shipping_total_cents,
        tax_total_cents: calculate_total_tax_cents(order, fulfillment_type, shipping, shipping_total_cents, artworks)
      }
      order.update!(
        attrs.merge(
          fulfillment_type: fulfillment_type,
          buyer_phone_number: phone_number,
          shipping_name: shipping[:name],
          shipping_address_line1: shipping[:address_line1],
          shipping_address_line2: shipping[:address_line2],
          shipping_city: shipping[:city],
          shipping_region: shipping[:region],
          shipping_country: shipping[:country],
          shipping_postal_code: shipping[:postal_code]
        )
      )
      OrderTotalUpdaterService.new(order).update_totals!
    end
    order
  end

  def self.fulfill_at_once!(order, fulfillment, by)
    order.fulfill! do
      fulfillment = Fulfillment.create!(fulfillment.slice(:courier, :tracking_id, :estimated_delivery))
      order.line_items.each do |li|
        li.line_item_fulfillments.create!(fulfillment_id: fulfillment.id)
      end
    end
    PostNotificationJob.perform_later(order.id, Order::FULFILLED, by)
    order
  end

  def self.abandon!(order)
    order.abandon!
  end

  def self.validate_artwork!(artwork)
    raise Errors::OrderError, 'Cannot set shipping, unknown artwork' unless artwork
    raise Errors::OrderError, 'Cannot set shipping, missing artwork location' if artwork[:location].blank?
  end

  def self.calculate_total_tax_cents(order, fulfillment_type, shipping, shipping_total_cents, artworks)
    order.line_items.map do |li|
      sales_tax = SalesTaxService.new(li, fulfillment_type, shipping, shipping_total_cents, artworks[li.artwork_id][:location]).sales_tax
      li.update!(sales_tax_cents: sales_tax)
      sales_tax
    end.sum
  end
end
