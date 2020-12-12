require 'rails_helper'
require 'support/gravity_helper'

describe PaymentMethodService, type: :services do
  include_context 'include stripe helper'
  let(:seller_id) { 'seller1' }
  let(:buyer_id) { 'user-1' }
  let(:order) do
    Fabricate(
      :order,
      credit_card_id: 'cc_1',
      buyer_id: buyer_id,
      seller_id: seller_id
    )
  end
  let(:stub_gravity_partner) do
    stub_request(
      :get,
      "#{
        Rails.application.config_for(:gravity)['api_v1_root']
      }/partner/seller1/all"
    ).to_return(body: gravity_v1_partner(_id: seller_id).to_json)
  end
  let(:stub_gravity_merchant_account_request) do
    stub_request(
      :get,
      "#{
        Rails.application.config_for(:gravity)['api_v1_root']
      }/merchant_accounts?partner_id=seller1"
    ).to_return(body: [{ external_id: 'ma-1' }].to_json)
  end
  let(:gravity_credit_card) do
    { external_id: 'cc_1', customer_account: { external_id: 'ca_1' } }
  end
  let(:stub_gravity_card_request) do
    stub_request(
      :get,
      "#{
        Rails.application.config_for(:gravity)['api_v1_root']
      }/credit_card/cc_1"
    ).to_return(body: gravity_credit_card.to_json)
  end
  describe 'verify_payment_method' do
    it 'returns successful transaction for succeeded payment methods' do
      prepare_setup_intent_retrieve
      transaction = PaymentMethodService.verify_payment_method('si_1')
      expect(transaction).to have_attributes(
        external_id: 'si_1',
        external_type: Transaction::SETUP_INTENT,
        transaction_type: Transaction::CONFIRM,
        status: Transaction::SUCCESS
      )
    end
    it 'returns requires_action transaction for payment_method still needing require action' do
      prepare_setup_intent_retrieve(status: 'requires_action')
      transaction = PaymentMethodService.verify_payment_method('si_1')
      expect(transaction).to have_attributes(
        external_id: 'si_1',
        external_type: Transaction::SETUP_INTENT,
        transaction_type: Transaction::CONFIRM,
        status: Transaction::REQUIRES_ACTION
      )
    end
  end

  describe 'confirm_payment_method' do
    before do
      stub_gravity_partner
      stub_gravity_merchant_account_request
      stub_gravity_card_request
    end
    context 'when requires action' do
      it 'returns requires_action transaction' do
        prepare_setup_intent_create(
          payment_method: 'cc_1',
          status: 'requires_action'
        )
        transaction = PaymentMethodService.confirm_payment_method!(order)
        expect(transaction).to have_attributes(
          external_id: 'si_1',
          external_type: Transaction::SETUP_INTENT,
          status: Transaction::REQUIRES_ACTION,
          transaction_type: Transaction::CONFIRM
        )
      end
    end
    context 'when succeeded' do
      before do
        prepare_setup_intent_create(payment_method: 'cc_1', status: 'succeeded')
      end
      it 'returns successful transaction' do
        transaction = PaymentMethodService.confirm_payment_method!(order)
        expect(transaction).to have_attributes(
          external_id: 'si_1',
          external_type: Transaction::SETUP_INTENT,
          status: Transaction::SUCCESS,
          transaction_type: Transaction::CONFIRM
        )
      end
    end
  end
end
