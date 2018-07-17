require 'rails_helper'
require 'support/gravity_helper'

describe PaymentService, type: :services do
  let(:credit_card_id) { 'cc-1' }
  let(:merchant_account_id) { 'ma-1' }
  let(:currency_code) { 'usd' }
  let(:charge_amount) { 2222 }
  let(:authorize_charge_params) { { amount: charge_amount, currency: currency_code, description: 'Artsy', source: credit_card_id, destination: merchant_account_id, capture: false } }
  let(:charge) { { id: 'ch_22' } }

  describe '#authorize_charge' do
    it "authorizes a charge on the user's credit card" do
      allow(Stripe::Charge).to receive(:create).with(authorize_charge_params).and_return(charge)
      PaymentService.authorize_charge(credit_card_id, merchant_account_id, charge_amount, currency_code)
      expect(Stripe::Charge).to have_received(:create).with(authorize_charge_params)
    end
  end
end
