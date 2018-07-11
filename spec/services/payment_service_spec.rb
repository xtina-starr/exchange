require 'rails_helper'
require 'support/gravity_helper'

describe PaymentService, type: :services do
  let(:credit_card_id) { 'cc-1' }
  let(:destination_account_id) { 'destination_account' }
  let(:charge_amount) { 2222 }
  let (:invalid_order) { Fabricate(:order) }
  let(:order) { Fabricate(:order, credit_card_id: credit_card_id, destination_account_id: destination_account_id) }
  let(:authorize_charge_params) { { amount: charge_amount, currency: order.currency_code, description: 'Artsy', source: order.credit_card_id, destination: order.destination_account_id, capture: false } }
  let(:charge) { { id: 'ch_22' } }

  describe '#authorize_charge' do
    context 'with order with valid payment info' do
      it "authorizes a charge on the user's credit card and records the transaction" do
        allow(Stripe::Charge).to receive(:create).with(authorize_charge_params).and_return(charge)
        allow(PaymentService).to receive(:valid_destination_account?).and_return(true)
        allow(TransactionService).to receive(:create!).with(order, charge)

        PaymentService.authorize_charge(order, charge_amount)
        expect(Stripe::Charge).to have_received(:create).with(authorize_charge_params)
        expect(TransactionService).to have_received(:create!).with(order, charge)
      end
    end

    context 'with order with invalid destination account' do
      it 'raises a PaymentError and does not authorize a charge' do
        allow(PaymentService).to receive(:valid_destination_account?).and_return(false)
        expect {
          PaymentService.authorize_charge(invalid_order, charge_amount) 
        }.to raise_error(Errors::PaymentError)
      end
    end
  end

  describe '#valid_destination_account?' do
    it "returns true if the destination account matches the partner's account" do
    end

    it "returns false if the destination account does not match the partner's account" do
    end
  end
end