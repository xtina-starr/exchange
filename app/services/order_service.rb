module OrderService
  def self.create!(params)
    Order.create!(params)
  end
end