require 'rails_helper'
require 'support/gravity_helper'

describe OrderValidator, type: :services do
  include_context 'use stripe mock'

  let(:seller_id) { 'partner-1' }
  let(:partner) { { id: seller_id, effective_commission_rate: 0.01 } }
  let(:partner_missing_commission_rate) { { id: seller_id, effective_commission_rate: nil } }
  let(:credit_card_id) { 'cc-1' }
  let(:user_id) { 'dr-collector' }
  let(:order) do
    Fabricate(
      :order,
      seller_id: seller_id,
      credit_card_id: credit_card_id,
      fulfillment_type: Order::PICKUP
    )
  end
  let(:artwork1) { { _id: 'a-1', current_version_id: '1' } }
  let(:artwork2) { { _id: 'a-2', current_version_id: '1' } }
  let!(:line_items) do
    [
      Fabricate(:line_item, order: order, list_price_cents: 2000_00, artwork_id: artwork1[:_id], artwork_version_id: artwork1[:current_version_id], quantity: 1),
      Fabricate(:line_item, order: order, list_price_cents: 8000_00, artwork_id: artwork2[:_id], artwork_version_id: artwork2[:current_version_id], edition_set_id: 'es-1', quantity: 2)
    ]
  end
  let(:credit_card) { { external_id: stripe_customer.default_source, customer_account: { external_id: stripe_customer.id }, deactivated_at: nil } }
  let(:merchant_account_id) { 'ma-1' }
  let(:partner_merchant_accounts) { [{ external_id: 'ma-1' }, { external_id: 'some_account' }] }
  let(:create_charge_params) do
    {
      source_id: credit_card[:external_id],
      destination_id: merchant_account_id,
      customer_id: credit_card[:customer_account][:external_id],
      amount: order.buyer_total_cents,
      currency_code: order.currency_code
    }
  end
  let(:artwork_inventory_deduct_request) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a-1/inventory").with(body: { deduct: 1 }).to_return(status: 200, body: {}.to_json) }
  let(:edition_set_inventory_deduct_request) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a-2/edition_set/es-1/inventory").with(body: { deduct: 2 }).to_return(status: 200, body: {}.to_json) }
  let(:artwork_inventory_undeduct_request) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a-1/inventory").with(body: { undeduct: 1 }).to_return(status: 200, body: {}.to_json) }
  let(:edition_set_inventory_undeduct_request) { stub_request(:put, "#{Rails.application.config_for(:gravity)['api_v1_root']}/artwork/a-2/edition_set/es-1/inventory").with(body: { undeduct: 2 }).to_return(status: 200, body: {}.to_json) }
  let(:service) do
    class TestService
      include OrderValidator
    end
    TestService.new
  end
  let(:transaction) { Fabricate(:transaction, status: Transaction::SUCCESS) }
  let(:failed_transaction) { Fabricate(:transaction, status: Transaction::FAILURE) }

  describe '#validate_commission_rate!' do
    context 'with a partner with missing commission rate' do
      it 'raises an error' do
        expect { service.validate_commission_rate!(partner_missing_commission_rate) }.to raise_error do |error|
          expect(error).to be_a(Errors::ValidationError)
          expect(error.code).to eq :missing_commission_rate
          expect(error.data).to match(partner_id: seller_id)
        end
      end
    end
  end

  describe '#validate_artwork_versions!' do
    context 'with mismatched artwork versions' do
      it 'raises an error and records the artwork mismatch in DataDog' do
        expect(GravityService).to receive(:get_artwork).with(artwork1[:_id]).and_return(artwork1.merge(current_version_id: 2))
        expect(Exchange).to receive_message_chain(:dogstatsd, :increment).with('submit.artwork_version_mismatch')
        expect { service.validate_artwork_versions!(order) }.to raise_error do |error|
          expect(error).to be_a(Errors::ProcessingError)
          expect(error.code).to eq :artwork_version_mismatch
        end
      end
    end
  end

  describe '#validate_credit_card!' do
    it 'raises an error if the credit card does not have an external id' do
      expect { service.validate_credit_card!(id: 'cc-1', customer_account: { external_id: 'cust-1' }, deactivated_at: nil) }.to raise_error do |error|
        expect(error).to be_a(Errors::ValidationError)
        expect(error.code).to eq :credit_card_missing_external_id
        expect(error.data).to match(credit_card_id: 'cc-1')
      end
    end

    it 'raises an error if the credit card does not have a customer account' do
      expect { service.validate_credit_card!(id: 'cc-1', external_id: 'cc-1') }.to raise_error do |error|
        expect(error).to be_a(Errors::ValidationError)
        expect(error.code).to eq :credit_card_missing_customer
        expect(error.data).to match(credit_card_id: 'cc-1')
      end
    end

    it 'raises an error if the credit card does not have a customer account external id' do
      expect { service.validate_credit_card!(id: 'cc-1', external_id: 'cc-1', customer_account: { some_prop: 'some_val' }, deactivated_at: nil) }.to raise_error do |error|
        expect(error).to be_a(Errors::ValidationError)
        expect(error.code).to eq :credit_card_missing_customer
        expect(error.data).to match(credit_card_id: 'cc-1')
      end
    end

    it 'raises an error if the card is deactivated' do
      expect { service.validate_credit_card!(id: 'cc-1', external_id: 'cc-1', customer_account: { external_id: 'cust-1' }, deactivated_at: 2.days.ago) }.to raise_error do |error|
        expect(error).to be_a(Errors::ValidationError)
        expect(error.code).to eq :credit_card_deactivated
        expect(error.data).to match(credit_card_id: 'cc-1')
      end
    end
  end
end
