module OrderService
  def self.create!(user_id:, partner_id:, currency_code:, line_items: [])
    raise Errors::OrderError, 'Currency not supported' unless valid_currency_code?(currency_code)
    raise Errors::OrderError, 'Existing pending order' if create_params_has_pending_order?(user_id, line_items)
    Order.transaction do
      order = Order.create!(user_id: user_id, partner_id: partner_id, currency_code: currency_code)
      line_items.each { |li| LineItemService.create!(order, li) }
      order
    end
  end

  def self.submit!(order, credit_card_id:, shipping_info: '')
    raise Errors::OrderError, 'Order cannot be submitted' unless order.pending?
    Order.transaction do
      # verify price change?
      # TODO: hold the charge for this price on credit card
      order.update!(state: Order::SUBMITTED, credit_card_id: credit_card_id)
      # status submitted
    end
    order
  end

  def self.approve!(order)
    raise Errors::OrderError, 'Order cannot be approved' unless order.submitted?
    Order.transaction do
      order.update!(state: Order::APPROVED)
      # TODO: process the charge by calling gravity with current credit_card_id and price
    end
    order
  end

  def self.finalize!(order)
    raise Errors::OrderError, 'Order cannot be finalized' unless order.approved?
    Order.transaction do
      order.update!(state: Order::FINALIZED)
      # TODO: process the charge by calling gravity with current credit_card_id and price
    end
    order
  end

  def self.reject!(order)
    raise Errors::OrderError, 'Order cannot be rejected' unless order.submitted?
    Order.transaction do
      order.update!(state: Order::REJECTED)
      # TODO: release the charge
    end
    order
  end

  def self.user_pending_artwork_order(user_id, artwork_id, edition_set_id = nil)
    Order.pending.joins(:line_items).find_by(user_id: user_id, line_items: { artwork_id: artwork_id, edition_set_id: edition_set_id })
  end

  def self.create_params_has_pending_order?(user_id, line_items)
    line_items.map { |li| user_pending_artwork_order(user_id, li[:artwork_id], li[:edition_set_id]) }.any?
  end

  def self.valid_currency_code?(currency_code)
    currency_code == 'usd'
  end
end
