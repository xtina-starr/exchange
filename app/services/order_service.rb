module OrderService
  def self.create!(params)
    Order.transaction do
      line_items = params[:line_items]
      order = Order.create!(params.except(:line_items))
      line_items.each { |li_param| LineItemService.create!(order, li_param) } if line_items 
      order
    end
  end

  def self.submit(order, shipping_info:, credit_card_id:)
    # verify price change
    # hold price on credit card
    # status submitted
  end

  def self.abandon(order)
  end

  def self.user_pending_artwork_order(user_id, artwork_id, edition_set_id=nil)
    Order.pending.joins(:line_items).find_by(user_id: user_id, line_items: { artwork_id: artwork_id, edition_set_id: edition_set_id })
  end

  def self.create_params_has_pending_order?(params)
    params[:line_items].map { |li_param| user_pending_artwork_order(params[:user_id], li_param[:artwork_id], li_param[:edition_set_id]) }.any?
  end
end
