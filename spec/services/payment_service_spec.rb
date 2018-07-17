require 'rails_helper'
require 'support/gravity_helper'

describe PaymentService, type: :services do
  let(:credit_card_id) { 'cc-1' }
  let(:merchant_account_id) { 'destination_account' }
  let(:charge_amount) { 2222 }
  let(:order) { Fabricate(:order, credit_card_id: credit_card_id) }
  let(:authorize_charge_params) { { amount: charge_amount, currency: order.currency_code, description: 'Artsy', source: order.credit_card_id, destination: merchant_account_id, capture: false } }
  let(:charge) { { id: 'ch_22' } }
  let(:partner_merchant_accounts) { [{ external_id: merchant_account_id }, { external_id: 'some_account' }] }

  describe '#authorize_charge' do
    it "authorizes a charge on the user's credit card" do
      allow(Stripe::Charge).to receive(:create).with(authorize_charge_params).and_return(charge)
      allow(PaymentService).to receive(:get_merchant_account_id).and_return(merchant_account_id)

      PaymentService.authorize_charge(order, charge_amount)
      expect(Stripe::Charge).to have_received(:create).with(authorize_charge_params)
    end

    context 'with a partner that does not have a merchant account ID' do
      it 'raises a PaymentError and does not authorize a charge' do
        allow(PaymentService).to receive(:get_merchant_account_id).and_return(nil)
        expect { PaymentService.authorize_charge(order, charge_amount) }.to raise_error(Errors::PaymentError)
      end
    end
  end

  describe '#get_merchant_account_id' do
    it 'calls the /merchant_accounts Gravity endpoint' do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{order.partner_id}").and_return(partner_merchant_accounts)
      PaymentService.get_merchant_account_id(order.partner_id)
      expect(Adapters::GravityV1).to have_received(:request).with("/merchant_accounts?partner_id=#{order.partner_id}")
    end

    it "returns the first merchant account of the partner's merchant accounts" do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{order.partner_id}").and_return(partner_merchant_accounts)
      result = PaymentService.get_merchant_account_id(order.partner_id)
      expect(result).to be(merchant_account_id)
    end

    it 'returns nil if the partner does not have a merchant account' do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{order.partner_id}").and_return([])
      result = PaymentService.get_merchant_account_id(order.partner_id)
      expect(result).to be(nil)
    end
  end
end
