require 'rails_helper'
require 'support/gravity_helper'

describe PaymentService, type: :services do
  let(:source_id) { 'cc-1' }
  let(:destination_id) { 'ma-1' }
  let(:customer_id) { 'cust-1' }
  let(:currency_code) { 'usd' }
  let(:charge_amount) { 2222 }
  let(:authorize_charge_params) { { amount: charge_amount, currency: currency_code, description: 'Artsy', source: source_id, customer: customer_id, destination: destination_id, capture: false } }
  let(:charge) { { id: 'ch_22' } }

  describe '#authorize_charge' do
    it "authorizes a charge on the user's credit card" do
      allow(Stripe::Charge).to receive(:create).with(authorize_charge_params).and_return(charge)
      params = {
        source_id: source_id,
        customer_id: customer_id,
        destination_id: destination_id,
        currency_code: currency_code,
        amount: charge_amount
      }
      PaymentService.authorize_charge(params)
      expect(Stripe::Charge).to have_received(:create).with(authorize_charge_params)
    end
  end
end
