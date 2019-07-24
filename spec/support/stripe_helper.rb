RSpec.shared_context 'include stripe helper' do
  before { StripeMock.start }
  after { StripeMock.stop }

  def prepare_charge_capture_failure(charge_id, code, decline_code)
    error = Stripe::StripeError.new
    allow(error).to receive(:json_body).and_return(error: stripe_exception_json_body(charge_id: charge_id, code: code, decline_code: decline_code))
    fail_charge = double
    allow(fail_charge).to receive(:capture).and_raise(error)
    allow(Stripe::Charge).to receive(:retrieve).and_return(fail_charge)
  end

  def prepare_charge_capture_success(charge_id = 'ch_1', destination_id = 'ac_1', amount = 200_00)
    charge = double(id: charge_id, payment_method: 'cc_1', destination: destination_id, amount: amount)
    allow(Stripe::Charge).to receive(:retrieve).and_return(charge)
    allow(charge).to receive(:capture)
  end

  def prepare_payment_intent_create_failure(status:, charge_error: nil, capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, capture_method: capture ? 'automatic' : 'manual', amount: amount, status: status, last_payment_error: double(charge_error))
    mock_payment_intent_call(:create, payment_intent)
  end

  def prepare_payment_intent_create_success(capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, capture_method: capture ? 'automatic' : 'manual', status: 'succeeded')
    mock_payment_intent_call(:create, payment_intent)
  end

  def prepare_payment_intent_capture_failure(status:, charge_error: nil, capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, capture_method: capture ? 'automatic' : 'manual', status: status, transfer_data: double(destination: 'ma_1'), last_payment_error: double(charge_error))
    allow(payment_intent).to receive(:status).and_return('requires_capture', 'requires_payment_method')
    allow(payment_intent).to receive(:capture)
    mock_payment_intent_call(:retrieve, payment_intent)
  end

  def prepare_payment_intent_capture_success(capture: false, payment_method: 'cc_1', amount: 20_00)
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, capture_method: capture ? 'automatic' : 'manual', transfer_data: double(destination: 'ma_1'))
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

  def prepare_payment_intent_refund_failure(charge_id: 'ch_1', payment_method: 'cc_1', amount: 20_00, code:, decline_code:, message:)
    refund_error = Stripe::StripeError.new
    allow(refund_error).to receive(:json_body).and_return(error: stripe_exception_json_body(charge_id: charge_id, code: code, decline_code: decline_code, message: message))
    payment_intent = double(id: 'pi_1', payment_method: payment_method, amount: amount, transfer_data: double(destination: 'ma_1'), charges: [double(id: 'ch_1')])
    allow(payment_intent).to receive(:status).and_return('requires_capture', 'succeeded')
    allow(Stripe::Refund).to receive(:create).with(charge: 'ch_1', reverse_transfer: true).and_raise(refund_error)
    mock_payment_intent_call(:retrieve, payment_intent)
  end

  def mock_payment_intent_call(method, payment_intent)
    allow(payment_intent).to receive(:to_h).and_return(id: 'pi_1')
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
end
