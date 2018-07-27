require 'rails_helper'
require 'support/gravity_helper'

describe OrderSubmitService, type: :services do
  let(:partner_id) { 'partner-1' }
  let(:order) { Fabricate(:order, partner_id: partner_id, credit_card_id: 'cc-1', fulfillment_type: Order::PICKUP) }
  let!(:line_items) { [Fabricate(:line_item, order: order, price_cents: 2000_00), Fabricate(:line_item, order: order, price_cents: 8000_00)] }
  let(:credit_card) { { external_id: 'card-1', customer_account: { external_id: 'cust-1' }, deactivated_at: nil } }
  let(:merchant_account_id) { 'ma-1' }
  let(:charge_success) { { id: 'ch-1' } }
  let(:charge_failure) { { failure_message: 'some_error' } }
  let(:partner_merchant_accounts) { [{ external_id: 'ma-1' }, { external_id: 'some_account' }] }
  let(:authorize_charge_params) do
    {
      source_id: credit_card[:external_id],
      destination_id: merchant_account_id,
      customer_id: credit_card[:customer_account][:external_id],
      amount: order.buyer_total_cents,
      currency_code: order.currency_code
    }
  end

  describe '#submit!' do
    context 'with a partner with a merchant account' do
      context 'with a successful transaction' do
        before(:each) do
          allow(OrderSubmitService).to receive(:get_merchant_account).with(order).and_return(partner_merchant_accounts.first)
          allow(OrderSubmitService).to receive(:get_credit_card).with(order).and_return(credit_card)
          allow(PaymentService).to receive(:authorize_charge).with(authorize_charge_params).and_return(charge_success)
          allow(TransactionService).to receive(:create_success!).with(order, charge_success)
          allow(Adapters::GravityV1).to receive(:request).with("/partner/#{partner_id}/all").and_return(gravity_v1_partner)
          OrderSubmitService.submit!(order)
        end

        it 'authorizes a charge for the full amount of the order' do
          expect(PaymentService).to have_received(:authorize_charge).with(authorize_charge_params)
        end

        it 'creates a record of the transaction' do
          expect(TransactionService).to have_received(:create_success!).with(order, charge_success)
        end

        it 'updates the order expiration time' do
          expect(order.state_expires_at).to eq(order.state_updated_at + 2.days)
        end

        it 'updates the order state to SUBMITTED' do
          expect(order.state).to eq Order::SUBMITTED
          expect(order.state_updated_at).not_to be_nil
        end

        it 'updates external_charge_id with the id of the charge' do
          expect(order.external_charge_id).to eq(charge_success[:id])
        end

        it 'sets commission_fee_cents' do
          expect(order.commission_fee_cents).to eq 8000_00
        end
      end

      context 'with an unsuccessful transaction' do
        it 'creates a record of the transaction' do
          allow(OrderSubmitService).to receive(:get_merchant_account).with(order).and_return(partner_merchant_accounts.first)
          allow(OrderSubmitService).to receive(:get_credit_card).with(order).and_return(credit_card)
          allow(PaymentService).to receive(:authorize_charge).with(authorize_charge_params).and_raise(Errors::PaymentError.new('some_error', charge_failure))
          allow(TransactionService).to receive(:create_failure!).with(order, charge_failure)
          expect { OrderSubmitService.submit!(order) }.to raise_error(Errors::PaymentError)
          expect(TransactionService).to have_received(:create_failure!).with(order, charge_failure)
        end
      end
    end
  end

  describe '#get_merchant_account' do
    it 'calls the /merchant_accounts Gravity endpoint' do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{order.partner_id}").and_return(partner_merchant_accounts)
      OrderSubmitService.get_merchant_account(order)
      expect(Adapters::GravityV1).to have_received(:request).with("/merchant_accounts?partner_id=#{order.partner_id}")
    end

    it "returns the first merchant account of the partner's merchant accounts" do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{order.partner_id}").and_return(partner_merchant_accounts)
      result = OrderSubmitService.get_merchant_account(order)
      expect(result).to be(partner_merchant_accounts.first)
    end

    it 'raises an error if the partner does not have a merchant account' do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{order.partner_id}").and_return([])
      expect { OrderSubmitService.get_merchant_account(order) }.to raise_error(Errors::OrderError)
    end
  end

  describe '#get_credit_card' do
    it 'calls the /credit_card Gravity endpoint and validates the credit card' do
      allow(Adapters::GravityV1).to receive(:request).with("/credit_card/#{order.credit_card_id}").and_return(credit_card)
      allow(OrderSubmitService).to receive(:validate_credit_card).with(credit_card)
      OrderSubmitService.get_credit_card(order)
      expect(Adapters::GravityV1).to have_received(:request).with("/credit_card/#{order.credit_card_id}")
      expect(OrderSubmitService).to have_received(:validate_credit_card).with(credit_card)
    end
  end

  describe '#validate_credit_card' do
    it 'raises an error if the credit card does not have an external id' do
      expect { OrderSubmitService.validate_credit_card(customer_account: { external_id: 'cust-1' }, deactivated_at: nil) }.to raise_error(Errors::OrderError)
    end

    it 'raises an error if the credit card does not have a customer id' do
      expect { OrderSubmitService.validate_credit_card(external_id: 'cc-1') }.to raise_error(Errors::OrderError)
      expect { OrderSubmitService.validate_credit_card(external_id: 'cc-1', customer_account: { some_prop: 'some_val' }, deactivated_at: nil) }.to raise_error(Errors::OrderError)
    end

    it 'raises an error if the card is deactivated' do
      expect { OrderSubmitService.validate_credit_card(external_id: 'cc-1', customer_account: { external_id: 'cust-1' }, deactivated_at: 'today') }.to raise_error(Errors::OrderError)
    end
  end

  describe '#calculate_commission' do
    context 'with successful gravity call' do
      before do
        stub_request(:get, %r{partner\/#{partner_id}/all}).to_return(status: 200, body: gravity_v1_partner.to_json)
      end
      it 'returns calculated commission fee' do
        expect(OrderSubmitService.calculate_commission(order)).to eq 8000_00.0
      end
    end
    context 'with failed gravity call' do
      before do
        stub_request(:get, %r{partner\/#{partner_id}}).to_return(status: 404, body: { error: 'not found' }.to_json)
      end
      it 'raises OrderError' do
        expect do
          OrderSubmitService.calculate_commission(order)
        end.to raise_error(Errors::OrderError, /Cannot fetch partner/)
      end
    end
  end
end
