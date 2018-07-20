require 'rails_helper'
require 'support/gravity_helper'
require 'stripe_mock'

describe PaymentService, type: :services do
  let(:stripe_helper) { StripeMock.create_test_helper }
  before { StripeMock.start }
  after { StripeMock.stop }

  let(:destination_id) { 'ma-1' }
  let(:currency_code) { 'usd' }
  let(:charge_amount) { 2222 }

  describe '#authorize_charge' do
    let(:stripe_customer) do
      Stripe::Customer.create(
        email: 'someuser@email.com',
        source: stripe_helper.generate_card_token
      )
    end

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
      end)
    end
  end

  describe '#capture_charge' do
    let(:uncaptured_charge) do
      Stripe::Charge.create(
        amount: charge_amount,
        currency: currency_code,
        source: stripe_helper.generate_card_token,
        destination: destination_id,
        description: 'Artsy',
        capture: false
      )
    end
    it 'captures a charge' do
      captured_charge = PaymentService.capture_charge(uncaptured_charge.id)
      expect(captured_charge.captured).to eq(true)
    end
    it 'catches Stripe errors and raises a PaymentError in its place' do
      StripeMock.prepare_card_error(:card_declined, :capture_charge)
      expect { PaymentService.capture_charge(uncaptured_charge.id) }.to(raise_error do |e|
        expect(e).to be_a Errors::PaymentError
        expect(e.message).not_to eq nil
        expect(e.body[:id]).to eq uncaptured_charge.id
        expect(e.body[:failure_code]).not_to eq nil
        expect(e.body[:failure_message]).not_to eq nil
      end)
    end
  end
end
