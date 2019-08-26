require 'rails_helper'
require 'support/gravity_helper'

describe PaymentMethodService, type: :services do
  include_context 'include stripe helper'
  let(:seller_id) { 'seller1' }
  let(:buyer_id) { 'user-1' }
  let(:order) { Fabricate(:order, credit_card_id: 'cc_1', buyer_id: buyer_id, seller_id: seller_id) }
  let(:stub_gravity_partner) { stub_request(:get, "#{Rails.application.config_for(:gravity)['api_v1_root']}/partner/seller1/all").to_return(body: gravity_v1_partner(_id: seller_id).to_json) }
  let(:stub_gravity_merchant_account_request) { stub_request(:get, "#{Rails.application.config_for(:gravity)['api_v1_root']}/merchant_accounts?partner_id=seller1").to_return(body: [{ external_id: 'ma-1' }].to_json) }
  let(:gravity_credit_card) { { external_id: 'cc_1', customer_account: { external_id: 'ca_1' } } }
  let(:stub_gravity_card_request) { stub_request(:get, "#{Rails.application.config_for(:gravity)['api_v1_root']}/credit_card/cc_1").to_return(body: gravity_credit_card.to_json) }
  describe 'confirm_payment_method' do
    before do
      stub_gravity_partner
      stub_gravity_merchant_account_request
      stub_gravity_card_request
    end
    context 'when requires action' do
      it 'returns requires_action transaction' do
        prepare_setup_intent_create(payment_method: 'cc_1', status: 'requires_action')
        transaction = PaymentMethodService.confirm_payment_method!(order)
        expect(transaction).to have_attributes(external_id: 'si_1', external_type: Transaction::SETUP_INTENT, status: Transaction::REQUIRES_ACTION, transaction_type: Transaction::CONFIRM)
      end
    end
    context 'when succeeded' do
      before do
        prepare_setup_intent_create(payment_method: 'cc_1', status: 'succeeded')
      end
      it 'returns successful transaction' do
        transaction = PaymentMethodService.confirm_payment_method!(order)
        expect(transaction).to have_attributes(external_id: 'si_1', external_type: Transaction::SETUP_INTENT, status: Transaction::SUCCESS, transaction_type: Transaction::CONFIRM)
      end
    end
  end
end
