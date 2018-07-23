module OrderService
  def self.set_payment!(order, credit_card_id:)
    raise Errors::OrderError, 'Cannot set payment info on non-pending orders' unless order.state == Order::PENDING
    Order.transaction do
      order.update!(credit_card_id: credit_card_id)
    end
    order
  end

  def self.set_shipping!(order, attributes)
    raise Errors::OrderError, 'Cannot set shipping info on non-pending orders' unless order.state == Order::PENDING

    Order.transaction do
      attrs = {
        shipping_total_cents: order.line_items.map { |li| ShippingService.calculate_shipping(li, attributes.slice(:shipping_country, :fulfillment_type)) }.sum,
        tax_total_cents: 100_00 # TODO: 🚨 replace this with real tax calculation 🚨
      }
      order.update!(
        attrs.merge(
          attributes.slice(
            :shipping_address_line1,
            :shipping_address_line2,
            :shipping_city,
            :shipping_region,
            :shipping_country,
            :shipping_postal_code,
            :fulfillment_type
          )
        )
      )
    end
    order
  end

  def self.approve!(order)
    Order.transaction do
      order.approve!
      order.save!
      # TODO: process the charge by calling gravity with current credit_card_id and price
    end
    order
  end

  def self.finalize!(order)
    Order.transaction do
      order.finalize!
      order.save!
      # TODO: process the charge by calling gravity with current credit_card_id and price
    end
    order
  end

  def self.reject!(order)
    Order.transaction do
      order.reject!
      order.save!
      # TODO: release the charge
    end
    order
  end

  def self.abandon!(order)
    Order.transaction do
      order.abandon!
      order.save!
    end
  end

  def self.valid_currency_code?(currency_code)
    currency_code == 'usd'
  end
end
