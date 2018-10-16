require 'rails_helper'

describe StripeWebhookService, type: :services do
  include_context 'use stripe mock'
  let(:state) { Order::APPROVED }
  let(:external_charge_id) { 'ch_some_id' }
  let!(:order) { Fabricate(:order, state: state, external_charge_id: external_charge_id) }
  let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: 'artwork-1') }

  context 'charge.refunded event' do
    let(:event_charge_id) { external_charge_id }
    let(:fully_refunded) { true }
    let(:charge_refunded_event) { StripeMock.mock_webhook_event('charge.refunded', id: event_charge_id, refunded: fully_refunded) }
    let(:service) { StripeWebhookService.new(charge_refunded_event) }
    context 'unknown charge id' do
      let(:event_charge_id) { 'ch_random' }
      it 'raises unknown_event_charge' do
        expect { service.process! }.to raise_error do |e|
          expect(e.type).to eq :processing
          expect(e.code).to eq :unknown_event_charge
          expect(e.data[:event_id]).to eq charge_refunded_event.id
          expect(e.data[:charge_id]).to eq event_charge_id
        end
      end
    end
    context 'known charge id' do
      it 'stores transaction and refunds the charge' do
      end
      it 'undeducts inventory' do
      end
    end
    context 'partial refunds' do
      let(:fully_refunded) { false }
      it 'raises unknown_event_charge' do
        expect { service.process! }.to raise_error do |e|
          expect(e.type).to eq :processing
          expect(e.code).to eq :received_partial_refund
          expect(e.data[:event_id]).to eq charge_refunded_event.id
          expect(e.data[:charge_id]).to eq event_charge_id
        end
      end
    end
  end
end
