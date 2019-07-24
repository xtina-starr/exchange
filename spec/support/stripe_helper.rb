RSpec.shared_context 'include stripe helper' do
  before { StripeMock.start }
  after { StripeMock.stop }

  def prepare_charge_capture_failure(charge_id, code, decline_code)
    error = Stripe::StripeError.new()
    allow(error).to receive(:json_body).and_return({error: stripe_exception_json_body(charge_id: charge_id, code: code, decline_code: decline_code)})
    fail_charge = double()
    allow(fail_charge).to receive(:capture).and_raise(error)
    allow(Stripe::Charge).to receive(:retrieve).and_return(fail_charge)
  end

  def prepare_charge_capture_success(charge_id = 'ch_1', destination_id = 'ac_1', amount = 200_00)
    charge = double(id: charge_id, payment_method: 'cc_1', destination: destination_id, amount: amount)
    allow(Stripe::Charge).to receive(:retrieve).and_return(charge)
    allow(charge).to receive(:capture)
  end

  def prepare_payment_intent_create_failure(status:, charge_error: nil, capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, status: status, last_payment_error: double(charge_error))
    mock_payment_intent_call(:create, payment_intent)
  end

  def prepare_payment_intent_create_success(capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, status: 'succeeded')
    mock_payment_intent_call(:create, payment_intent)
  end

  def prepare_payment_intent_capture_failure(status:, charge_error: nil, capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, status: status, transfer_data: double(destination: 'ma_1'), last_payment_error: double(charge_error))
    allow(payment_intent).to receive(:status).and_return('requires_capture', 'requires_payment_method')
    allow(payment_intent).to receive(:capture)
    mock_payment_intent_call(:retrieve, payment_intent)
  end

  def prepare_payment_intent_capture_success(capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, transfer_data: double(destination: 'ma_1'))
    allow(payment_intent).to receive(:status).and_return('requires_capture', 'succeeded')
    allow(payment_intent).to receive(:capture)
    mock_payment_intent_call(:retrieve, payment_intent)
  end

  def prepare_payment_intent_refund_success(payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, transfer_data: double(destination: 'ma_1'), charges: [double(id: 'ch_1')])
    allow(payment_intent).to receive(:status).and_return('requires_capture', 'succeeded')
    refund = double(id: 're_1')
    allow(Stripe::Refund).to receive(:create).with(charge: 'ch_1', reverse_transfer: true).and_return(refund)
    mock_payment_intent_call(:retrieve, payment_intent)
  end

  def prepare_payment_intent_refund_failure(charge_id: 'ch_1', payment_method: 'cc_1',  amount: 20_00, code:, decline_code:, message:)
    refund_error = Stripe::StripeError.new()
    allow(refund_error).to receive(:json_body).and_return({error: stripe_exception_json_body(charge_id: charge_id, code: code, decline_code: decline_code)})
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, transfer_data: double(destination: 'ma_1'), charges: [double(id: 'ch_1')])
    allow(payment_intent).to receive(:status).and_return('requires_capture', 'succeeded')
    allow(Stripe::Refund).to receive(:create).with(charge: 'ch_1', reverse_transfer: true).and_raise(refund_error)
    mock_payment_intent_call(:retrieve, payment_intent)
  end

  def mock_payment_intent_call(method, payment_intent)
    allow(payment_intent).to receive(:to_h).and_return({id: 'pi_1'})
    allow(Stripe::PaymentIntent).to receive(method).and_return(payment_intent)
  end

  def stripe_exception_json_body(props)
    {
      charge: 'ch_1',
      code: 'card_declined',
      decline_code: 'do_not_honor',
      message: 'The card was declined'
    }.merge(props)
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

  def charges_data(data = [])
    {
      data: data,
      object: 'list',
      has_more: false,
      total_count: data.count,
      url: "/v1/charges?payment_intent=pi_1EwXFB2eZvKYlo2CggNnFBo8"
    }
  end
end