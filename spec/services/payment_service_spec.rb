require 'rails_helper'
require 'support/gravity_helper'
require 'support/use_stripe_mock'

describe PaymentService, type: :services do
  include_context 'use stripe mock'

  let(:destination_id) { 'ma-1' }
  let(:currency_code) { 'usd' }
  let(:charge_amount) { 2222 }

  describe '#authorize_charge' do
    it "authorizes a charge on the user's credit card" do
      params = {
        source_id: stripe_customer.default_source,
        customer_id: stripe_customer.id,
        destination_id: destination_id,
        currency_code: currency_code,
        amount: charge_amount
      }
      charge = PaymentService.authorize_charge(params)
      expect(charge.amount).to eq(charge_amount)
      expect(charge.destination).to eq(destination_id)
      expect(charge.customer).to eq(stripe_customer.id)
      expect(charge.source.id).to eq(stripe_customer.default_source)
      expect(charge.currency).to eq(currency_code)
      expect(charge.description).to eq('Artsy')
      expect(charge.captured).to eq(false)
      expect(charge.transaction_type).to eq Transaction::HOLD
    end
    it 'catches Stripe errors and raises a PaymentError in its place' do
      StripeMock.prepare_card_error(:card_declined, :new_charge)
      params = {
        source_id: stripe_customer.default_source,
        customer_id: stripe_customer.id,
        destination_id: destination_id,
        currency_code: currency_code,
        amount: charge_amount
      }
      expect { PaymentService.authorize_charge(params) }.to(raise_error do |e|
        expect(e).to be_a Errors::PaymentError
        expect(e.message).not_to eq nil
        expect(e.body[:amount]).to eq charge_amount
        expect(e.body[:source_id]).to eq stripe_customer.default_source
        expect(e.body[:destination_id]).to eq destination_id
        expect(e.body[:failure_code]).not_to eq nil
        expect(e.body[:failure_message]).not_to eq nil
        expect(e.body[:transaction_type]).to eq Transaction::HOLD
      end)
    end
  end

  describe '#capture_charge' do
    it 'captures a charge' do
      captured_charge = PaymentService.capture_charge(uncaptured_charge.id)
      expect(captured_charge.captured).to eq(true)
      expect(captured_charge.transaction_type).to eq Transaction::CAPTURE
    end
    it 'catches Stripe errors and raises a PaymentError in its place' do
      StripeMock.prepare_card_error(:card_declined, :capture_charge)
      expect { PaymentService.capture_charge(uncaptured_charge.id) }.to(raise_error do |e|
        expect(e).to be_a Errors::PaymentError
        expect(e.message).not_to eq nil
        expect(e.body[:external_id]).to eq uncaptured_charge.id
        expect(e.body[:failure_code]).not_to eq nil
        expect(e.body[:failure_message]).not_to eq nil
        expect(e.body[:transaction_type]).to eq Transaction::CAPTURE
      end)
    end
  end

  describe '#refund_charge' do
    it 'refunds a charge for the full amount' do
      refund = PaymentService.refund_charge(captured_charge.id)
      expect(refund.amount).to eq captured_charge.amount
      expect(refund.charge).to eq captured_charge.id
      expect(refund.transaction_type).to eq Transaction::REFUND
    end
    it 'catches Stripe errors and raises a PaymentError in its place' do
      StripeMock.prepare_card_error(:processing_error, :new_refund)
      expect { PaymentService.refund_charge(captured_charge.id) }.to(raise_error do |e|
        expect(e).to be_a Errors::PaymentError
        expect(e.message).not_to eq nil
        expect(e.body[:failure_code]).not_to eq nil
        expect(e.body[:failure_message]).not_to eq nil
        expect(e.body[:transaction_type]).to eq Transaction::REFUND        
      end)
    end
  end
end
