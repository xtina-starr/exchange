require 'rails_helper'

describe OfferService, type: :services do
  describe '#create_pending_offer' do
    let(:offer_creator_id) { 'user-id' }
    let(:offer_from_id) { 'partner-id' }
    let(:offer_from_type) { Order::PARTNER }
    let(:order) { Fabricate(:order, state: Order::SUBMITTED) }
    let(:line_item) { Fabricate(:line_item, order: order, list_price_cents: 2000_00, artwork_id: 'artwork-1', quantity: 2) }
    let(:current_offer) { Fabricate(:offer, order: order, amount_cents: 10000, submitted_at: 1.day.ago) }

    before do
      order.line_items << line_item
    end

    context 'counter on last_offer' do
      before do
        order.update!(last_offer: current_offer)
        expect_any_instance_of(OfferCalculator).to receive_messages(shipping_total_cents: 100, tax_total_cents: 200, should_remit_sales_tax: false)
      end
      it 'adds a new offer to order and does not updates last offer' do
        OfferService.create_pending_offer(current_offer, amount_cents: 20000, from_id: offer_from_id, creator_id: offer_creator_id, from_type: offer_from_type)
        expect(order.offers.count).to eq(2)
        pending_offer = order.offers.reject { |offer| offer.id == order.last_offer.id }.first
        expect(pending_offer.amount_cents).to eq(20000)
        expect(pending_offer.responds_to).to eq(current_offer)
        expect(pending_offer.from_id).to eq(offer_from_id)
        expect(pending_offer.creator_id).to eq(offer_creator_id)
        expect(pending_offer.from_type).to eq(offer_from_type)
        expect(pending_offer.submitted_at).to be_nil
      end
    end

    it 'raises error for 0  offer amount' do
      expect {  OfferService.create_pending_offer(current_offer, amount_cents: 0, from_id: offer_from_id, creator_id: offer_creator_id, from_type: offer_from_type) }
        .to raise_error do |e|
          expect(e.type).to eq :validation
          expect(e.code).to eq :invalid_amount_cents
        end
    end

    it 'raises error for negative offer amount' do
      expect {  OfferService.create_pending_offer(current_offer, amount_cents: -10, from_id: offer_from_id, creator_id: offer_creator_id, from_type: offer_from_type) }
        .to raise_error do |e|
          expect(e.type).to eq :validation
          expect(e.code).to eq :invalid_amount_cents
        end
    end

    context 'attempting to counter not the last offer' do
      let!(:another_offer) { Fabricate(:offer, order: order) }

      before do
        order.update!(last_offer: another_offer)
      end

      it 'raises a validation error' do
        expect {  OfferService.create_pending_offer(current_offer, amount_cents: 20000, from_id: offer_from_id, creator_id: offer_creator_id, from_type: offer_from_type) }
          .to raise_error(Errors::ValidationError)
      end

      it 'does not change order and offers' do
        expect {  OfferService.create_pending_offer(current_offer, amount_cents: 20000, from_id: offer_from_id, creator_id: offer_creator_id, from_type: offer_from_type) }.to raise_error(Errors::ValidationError)

        expect(order.reload.state).to eq(Order::SUBMITTED)
        expect(order.reload.offers.count).to eq(2)
      end
    end
  end

  describe '#submit_pending_offer!' do
    let(:artwork) { gravity_v1_artwork }
    let(:offer_from_id) { 'user-id' }
    let(:order_seller_id) { 'partner-1' }
    let(:order) { Fabricate(:order, mode: Order::OFFER, state: Order::SUBMITTED, seller_id: order_seller_id) }
    let(:line_item_edition_set_id) { nil }
    let(:line_item) { Fabricate(:line_item, order: order, artwork_id: artwork[:_id], edition_set_id: line_item_edition_set_id) }
    let(:offer) { Fabricate(:offer, order: order, amount_cents: 10000, submitted_at: 1.day.ago) }
    let(:pending_offer) { Fabricate(:offer, order: order, amount_cents: 200_00, shipping_total_cents: 100_00, tax_total_cents: 50_00, responds_to: offer, from_id: offer_from_id) }
    let(:call_service) { OfferService.submit_pending_offer(pending_offer) }

    before do
      order.update!(last_offer: offer)
      order.line_items << line_item
      allow(Adapters::GravityV1).to receive(:get).with("/partner/#{order_seller_id}/all").and_return(gravity_v1_partner)
      allow(Adapters::GravityV1).to receive(:get).with("/artwork/#{line_item.artwork_id}").and_return(artwork)
    end

    context 'with counter on a submitted offer' do
      it 'submits the pending offer and updates last offer' do
        call_service
        expect(pending_offer.submitted_at).not_to be_nil
      end

      it 'updates order last offer' do
        call_service
        expect(order.offers.count).to eq(2)
        expect(order.last_offer).to eq(pending_offer)
        expect(order.last_offer.amount_cents).to eq(20000)
        expect(order.last_offer.responds_to).to eq(offer)
      end

      it 'updates orders totals' do
        call_service
        expect(order.items_total_cents).to eq 200_00
        expect(order.shipping_total_cents).to eq 100_00
        expect(order.tax_total_cents).to eq 50_00
        expect(order.commission_fee_cents).to eq 200_00 * 0.8
        expect(order.buyer_total_cents).to eq 350_00
        expect(order.transaction_fee_cents).to eq((350_00 * 2.9 / 100) + 30)
        expect(order.seller_total_cents).to eq 350_00 - order.commission_fee_cents - order.transaction_fee_cents
      end

      it 'updates order state expiration' do
        Timecop.freeze(Date.new(2018, 12, 17)) do
          call_service
          expect(order.reload.state_expires_at).to eq Offer::EXPIRATION.from_now
        end
      end

      it 'instruments a counter offer' do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('offer.submit')

        call_service

        expect(dd_statsd).to have_received(:increment).with('offer.submit')
      end

      it 'queues job for posting notification' do
        call_service
        expect(PostOrderNotificationJob).to have_been_enqueued
      end
      it 'queues job for order follow up' do
        call_service
        expect(OrderFollowUpJob).to have_been_enqueued
      end
    end

    context 'attempting to submit already submitted offer' do
      let(:pending_offer) { Fabricate(:offer, order: order, amount_cents: 20000, responds_to: offer, submitted_at: 1.minute.ago, from_id: offer_from_id) }
      it 'raises a validation error' do
        expect {  call_service }.to raise_error(Errors::ValidationError)
      end

      it 'does not instrument' do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('order.counter')

        expect { call_service }.to raise_error(Errors::ValidationError)

        expect(dd_statsd).to_not have_received(:increment)
      end
    end

    context 'attempting to submit someone elses offer' do
      let(:pending_offer) { Fabricate(:offer, order: order, amount_cents: 20000, responds_to: offer, submitted_at: 1.minute.ago, from_id: 'al-pachino') }
      it 'raises a validation error' do
        expect {  call_service }
          .to raise_error(Errors::ValidationError)
      end

      it 'does not instrument' do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('order.counter')

        expect { call_service }.to raise_error(Errors::ValidationError)

        expect(dd_statsd).to_not have_received(:increment)
      end
    end

    context 'without enough inventory' do
      let(:artwork) { gravity_v1_artwork(inventory: { count: 0, unlimited: false }) }
      it 'raises a processing error' do
        expect { call_service }.to raise_error do |e|
          expect(e.type).to eq :processing
          expect(e.code).to eq :insufficient_inventory
        end
      end
    end

    context 'without unlimited inventory' do
      let(:artwork) { gravity_v1_artwork(inventory: { count: 0, unlimited: true }) }
      it 'raises a processing error' do
        call_service
        expect(pending_offer.submitted_at).not_to be_nil
      end
    end
  end

  def stub_ddstatsd_instance
    dd_statsd = double(Datadog::Statsd)
    allow(Exchange).to receive(:dogstatsd).and_return(dd_statsd)

    dd_statsd
  end
end
