require 'rails_helper'

describe Api::WebhooksController, type: :request do
  describe '@POST #api/webhooks/stripe' do
    include_context 'use stripe mock'
    let(:state) { Order::APPROVED }
    let(:external_charge_id) { 'ch_some_id' }
    let!(:order) { Fabricate(:order, state: state, external_charge_id: external_charge_id) }
    let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: 'artwork-1') }
    let(:event_charge_id) { external_charge_id }
    let(:fully_refunded) { true }
    let(:charge_refunded_payload) do
      StripeMock.mock_webhook_payload(
        'charge.refunded',
        id: event_charge_id,
        refunded: fully_refunded,
        destination_id: 'mer_123'
      )
    end
    let(:charge_refunded_event) do
      StripeMock.mock_webhook_event(
        'charge.refunded',
        id: event_charge_id,
        refunded: fully_refunded,
        destination_id: 'mer_123'
      )
    end
    let(:random_event_payload) { StripeMock.mock_webhook_payload('plan.updated') }
    let(:random_event) { StripeMock.mock_webhook_event('plan.updated') }
    it 'returns 400 for unauthorized requests with wrong signature' do
      allow(Stripe::Webhook).to receive(:construct_event).and_raise(Stripe::SignatureVerificationError.new('invalid signature', '402'))
      post '/api/webhooks/stripe', params: charge_refunded_payload, headers: { 'HTTP_STRIPE_SIGNATURE' => 'test_header' }
      expect(response.status).to eq 400
    end
    it 'refunds the order' do
      allow(Stripe::Webhook).to receive(:construct_event).and_return(charge_refunded_event)
      expect(GravityService).to receive(:undeduct_inventory).once.with(line_item)
      post '/api/webhooks/stripe', params: charge_refunded_payload, headers: { 'HTTP_STRIPE_SIGNATURE' => 'test_header' }
      expect(response.status).to eq 204
      expect(order.reload.state).to eq Order::REFUNDED
      new_transaction = order.transactions.last
      expect(new_transaction.external_id).to eq charge_refunded_event.id
      expect(new_transaction.source_id).to eq charge_refunded_event.data.object.source.id
    end
    it 'ignores events we dont care about' do
      allow(Stripe::Webhook).to receive(:construct_event).and_return(random_event)
      post '/api/webhooks/stripe', params: random_event_payload, headers: { 'HTTP_STRIPE_SIGNATURE' => 'test_header' }
      expect(response.status).to eq 201
      expect(order.reload.transactions.count).to eq 0
    end
  end
end
