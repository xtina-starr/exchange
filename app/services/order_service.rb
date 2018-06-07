module OrderService
  def self.create!(params)
    Order.transaction do
      line_items = params[:line_items]
      order = Order.create!(params.except(:line_items))
      line_items.each { |li_param| OrderLineItemService.create!(order, li_param) } if line_items 
      order
    end
  end
end