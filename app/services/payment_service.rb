module PaymentService
  def self.authorize_charge(order)
    charge = Stripe::Charge.create(
      amount: order.items_total_cents,
      currency: 'usd',
      description: 'Example charge',
      source: order.credit_card_id,
      destination: order.destination_account_id,
      capture: false
    )
    TransactionService.create!(order, charge)
  end

  def self.validate_charge
    #TODO: Check for valid partner account ID and credit card ID
  end

end