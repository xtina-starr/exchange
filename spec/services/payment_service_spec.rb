require 'rails_helper'
require 'support/gravity_helper'
require 'support/use_stripe_mock'

describe PaymentService, type: :services do
  include_context 'use stripe mock'

  let(:currency_code) { 'usd' }
  let(:buyer_amount) { 20_00 }
  let(:seller_amount) { 10_00 }
  let(:credit_card) { { external_id: stripe_customer.default_source, customer_account: { external_id: stripe_customer.id } } }
  let(:merchant_account) { { external_id: 'ma-1' } }
  let(:params) do
    {
      buyer_amount: buyer_amount,
      credit_card: credit_card,
      currency_code: currency_code,
      description: 'Gallery via Artsy',
      merchant_account: merchant_account,
      metadata: { this: 'is', a: 'test' },
      seller_amount: seller_amount
    }
  end

  describe '#authorize_charge' do
    it "authorizes a charge on the user's credit card" do
      transaction = PaymentService.authorize_charge(params)
      expect(transaction.amount_cents).to eq(20_00)
      expect(transaction.source_id).to eq(stripe_customer.default_source)
      expect(transaction.status).to eq(Transaction::SUCCESS)
      expect(transaction.transaction_type).to eq Transaction::HOLD
      expect(transaction.failure_code).to be_nil
      expect(transaction.failure_message).to be_nil
    end
    it 'catches Stripe errors and raises a PaymentError in its place' do
      StripeMock.prepare_card_error(:card_declined, :new_charge)
      expect { PaymentService.authorize_charge(params) }.to(raise_error do |e|
        expect(e).to be_a Errors::PaymentError
        expect(e.message).not_to eq nil
        expect(e.transaction.amount_cents).to eq buyer_amount
        expect(e.transaction.source_id).to eq stripe_customer.default_source
        expect(e.transaction.destination_id).to eq 'ma-1'
        expect(e.transaction.failure_code).not_to eq nil
        expect(e.transaction.failure_message).not_to eq nil
        expect(e.transaction.transaction_type).to eq Transaction::HOLD
      end)
    end
  end

  describe '#capture_charge' do
    it 'captures a charge' do
      transaction = PaymentService.capture_charge(uncaptured_charge.id)
      expect(transaction.amount_cents).to eq(uncaptured_charge.amount)
      expect(transaction.transaction_type).to eq Transaction::CAPTURE
      expect(transaction.status).to eq Transaction::SUCCESS
    end
    it 'catches Stripe errors and raises a PaymentError in its place' do
      StripeMock.prepare_card_error(:card_declined, :capture_charge)
      expect { PaymentService.capture_charge(uncaptured_charge.id) }.to(raise_error do |e|
        expect(e).to be_a Errors::PaymentError
        expect(e.message).not_to eq nil
        expect(e.transaction.external_id).to eq uncaptured_charge.id
        expect(e.transaction.failure_code).not_to eq nil
        expect(e.transaction.failure_message).not_to eq nil
        expect(e.transaction.transaction_type).to eq Transaction::CAPTURE
      end)
    end
  end

  describe '#refund_charge' do
    it 'refunds a charge for the full amount' do
      transaction = PaymentService.refund_charge(captured_charge.id)
      expect(transaction.external_id).to match(/test_re/i)
      expect(transaction.transaction_type).to eq Transaction::REFUND
      expect(transaction.status).to eq Transaction::SUCCESS
    end
    it 'catches Stripe errors and raises a PaymentError in its place' do
      StripeMock.prepare_card_error(:processing_error, :new_refund)
      expect { PaymentService.refund_charge(captured_charge.id) }.to(raise_error do |e|
        expect(e).to be_a Errors::PaymentError
        expect(e.message).not_to eq nil
        expect(e.transaction.external_id).to eq captured_charge.id
        expect(e.transaction.failure_code).not_to eq nil
        expect(e.transaction.failure_message).not_to eq nil
        expect(e.transaction.transaction_type).to eq Transaction::REFUND
      end)
    end
  end
end
