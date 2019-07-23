module StripeHelper
  def succeeded_payment_intent(params)
    charge = Stripe::Charge.create()
    basic_payment_intent.merge(charges: [charge], status: 'succeeded').merge(params)
  end

  def requires_capture_payment_intent(params)
    charge = Stripe::Charge.create()
    basic_payment_intent.merge(charges: [], status: 'requires_capture').merge(params)
  end


  def basic_payment_intent
    {
      id: payment_intent_id,
      object: "payment_intent",
      amount: 49900,
      amount_capturable: 0,
      amount_received: 0,
      application: nil,
      application_fee_amount: nil,
      canceled_at: nil,
      cancellation_reason: nil,
      capture_method: "automatic",
      charges: {
        object: "list",
        data: [],
        has_more: false,
        total_count: 0,
        url: "/v1/charges?payment_intent=pi_1EwXFB2eZvKYlo2CggNnFBo8"
      },
      client_secret: "pi_1EwXFB2eZvKYlo2CggNnFBo8_secret_vOMkpqZu8ca7hxhfiO80tpT3v",
      confirmation_method: "manual",
      created: 1563208901,
      currency: "gbp",
      customer: nil,
      description: nil,
      invoice: nil,
      last_payment_error: nil,
      livemode: false,
      metadata: {},
      next_action: nil,
      on_behalf_of: nil,
      payment_method: nil,
      payment_method_types: [
        "card"
      ],
      receipt_email: nil,
      review: nil,
      setup_future_usage: nil,
      shipping: nil,
      source: nil,
      statement_descriptor: nil,
      status: "requires_action",
      transfer_data: nil,
      transfer_group: nil
    }
  end

  def charges_data(data: [])
    {
      data: data,
      object: 'list',
      has_more: false,
      total_count: data.count,
      url: "/v1/charges?payment_intent=pi_1EwXFB2eZvKYlo2CggNnFBo8"
    }
  end
end