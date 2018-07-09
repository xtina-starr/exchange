module PaymentService
  def self.authorize_charge(order)
    charge = Stripe::Charge.create(
      amount: order.items_total_cents,
      currency: 'usd',
      description: 'Example charge',
      source: order.credit_card_id,
      capture: false
    )
    TransactionService.create!(order, charge)
  end
end