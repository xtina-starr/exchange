module OrderSubmitService
  def self.submit!(order)
    raise Errors::OrderError, "Missing info for submitting order(#{order.id})" unless can_submit?(order)
    Order.transaction do
      # verify price change?
      order.submit!
      merchant_account = get_merchant_account(order)
      raise Errors::OrderError, 'Partner does not have merchant account' if merchant_account.nil?
      charge = PaymentService.authorize_charge(order.credit_card_id, merchant_account[:external_id], order.buyer_total_cents, order.currency_code)
      TransactionService.create_success!(order, charge)
      order.save!
    end
    order
  rescue Errors::PaymentError => e
    TransactionService.create_failure!(order, e.body)
    raise e
  end

  def self.get_merchant_account(order)
    Adapters::GravityV1.request("/merchant_accounts?partner_id=#{order.partner_id}").first
  end

  def self.can_submit?(order)
    order.shipping_info? && order.payment_info?
  end
end
