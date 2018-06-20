module OrderService
  def self.create!(user_id:, partner_id:, currency_code:, line_items: [])
    raise Errors::OrderError, 'Currency not supported' unless valid_currency_code?(currency_code)
    raise Errors::OrderError, 'Existing pending order' if create_params_has_pending_order?(user_id, line_items)
    Order.transaction do
      order = Order.create!(user_id: user_id, partner_id: partner_id, currency_code: currency_code, state: Order::PENDING)
      line_items.each { |li| LineItemService.create!(order, li) }
      # queue a job for few days from now to abandon the order
      order
    end
  end

  # rubocop:disable Lint/UnusedMethodArgument
  def self.submit!(order, credit_card_id:, shipping_info: '')
    Order.transaction do
      # verify price change?
      order.credit_card_id = credit_card_id
      # TODO: hold the charge for this price on credit card
      order.submit!
      order.save!
    end
    order
  end
  # rubocop:enable Lint/UnusedMethodArgument

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
