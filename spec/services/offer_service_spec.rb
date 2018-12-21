require 'rails_helper'
require 'support/gravity_helper'

describe OfferService, type: :services do
  describe '#submit_order_with_offer!' do
    let(:buyer_id) { 'user-id' }
    let(:seller_id) { 'partner-1' }
    let(:order_mode) { Order::OFFER }
    let(:order_state) { Order::PENDING }
    let(:offer_submitted_at) { nil }
    let(:shipping_info) do
      {
        shipping_name: 'Fname Lname',
        shipping_address_line1: '12 Vanak St',
        shipping_address_line2: 'P 80',
        shipping_city: 'Tehran',
        shipping_postal_code: '02198',
        buyer_phone_number: '00123456',
        shipping_country: 'IR',
        fulfillment_type: Order::SHIP
      }
    end
    let(:artwork) { gravity_v1_artwork(_id: 'a-1', current_version_id: '1') }
    let(:line_item_artwork_version) { artwork[:current_version_id] }
    let(:credit_card_id) { 'grav_c_id1' }
    let(:credit_card) { { external_id: 'cc-1', customer_account: { external_id: 'cus-1' }, deactivated_at: nil } }
    let(:order) { Fabricate(:order, buyer_id: buyer_id, seller_id: seller_id, mode: order_mode, state: order_state, credit_card_id: credit_card_id, **shipping_info) }
    let!(:offer) { Fabricate(:offer, order: order, submitted_at: offer_submitted_at, amount_cents: 1000_00, tax_total_cents: 20_00, shipping_total_cents: 30_00, creator_id: buyer_id) }
    let!(:line_item) { Fabricate(:line_item, order: order, list_price_cents: 2000_00, artwork_id: artwork[:_id], artwork_version_id: line_item_artwork_version, quantity: 2) }
    let(:call_service) { OfferService.submit_order_with_offer(offer) }
    describe 'failed process' do
      before do
        order.update!(last_offer: offer)
        expect(PostOrderNotificationJob).not_to receive(:perform_later)
        expect(OrderFollowUpJob).not_to receive(:perform_later)
        expect(ReminderFollowUpJob).not_to receive(:perform_later)
      end

      context 'without shipping info' do
        let(:shipping_info) { {} }
        it 'raises missing_required_info error' do
          expect { call_service }.to raise_error do |e|
            expect(e.type).to eq :validation
            expect(e.code).to eq :missing_required_info
          end
        end
      end

      context 'without payment info' do
        let(:credit_card_id) { nil }
        it 'raises missing_required_info error' do
          expect { call_service }.to raise_error do |e|
            expect(e.type).to eq :validation
            expect(e.code).to eq :missing_required_info
          end
        end
      end

      context 'artwork version mismatch' do
        let(:line_item_artwork_version) { 'some-other-version' }
        it 'raises artwork_version_mismatch error' do
          expect(Gravity).to receive(:get_artwork).with(artwork[:_id]).and_return(artwork)
          dd_statsd = stub_ddstatsd_instance
          expect(dd_statsd).to receive(:increment).with('submit.artwork_version_mismatch')
          expect { call_service }.to raise_error do |e|
            expect(e.type).to eq :processing
            expect(e.code).to eq :artwork_version_mismatch
          end
        end
      end

      context 'Buy order' do
        let(:order_mode) { Order::BUY }
        it 'raises cant_submit error' do
          expect { call_service }.to raise_error do |e|
            expect(e.type).to eq :validation
            expect(e.code).to eq :cant_submit
          end
        end
      end

      Order::STATES.reject { |s| [Order::CANCELED, Order::PENDING].include? s }.each do |state|
        context "#{state} order" do
          let(:order_state) { state }
          before do
            allow(Gravity).to receive(:get_artwork).with(artwork[:_id]).and_return(artwork)
            allow(Gravity).to receive(:get_credit_card).with(credit_card_id).and_return(credit_card)
            allow(Adapters::GravityV1).to receive(:get).with("/partner/#{seller_id}/all").and_return(gravity_v1_partner)
          end
          it 'raises cant_submit error' do
            expect { call_service }.to raise_error do |e|
              expect(e.type).to eq :validation
              expect(e.code).to eq :invalid_state
            end
          end
        end
      end

      describe '#assert_credit_card!' do
        before do
          allow(Gravity).to receive(:get_artwork).with(artwork[:_id]).and_return(artwork)
        end
        it 'raises an error if the credit card does not have an external id' do
          allow(Gravity).to receive(:get_credit_card).with(credit_card_id).and_return(id: 'cc-1', customer_account: { external_id: 'cust-1' }, deactivated_at: nil)
          expect { call_service }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq :credit_card_missing_external_id
          end
        end

        it 'raises an error if the credit card does not have a customer account' do
          allow(Gravity).to receive(:get_credit_card).with(credit_card_id).and_return(id: 'cc-1', external_id: 'cc-1')
          expect { call_service }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq :credit_card_missing_customer
          end
        end

        it 'raises an error if the credit card does not have a customer account external id' do
          allow(Gravity).to receive(:get_credit_card).with(credit_card_id).and_return(id: 'cc-1', external_id: 'cc-1', customer_account: { some_prop: 'some_val' }, deactivated_at: nil)
          expect { call_service }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq :credit_card_missing_customer
          end
        end

        it 'raises an error if the card is deactivated' do
          allow(Gravity).to receive(:get_credit_card).with(credit_card_id).and_return(id: 'cc-1', external_id: 'cc-1', customer_account: { external_id: 'cust-1' }, deactivated_at: 2.days.ago)
          expect { call_service }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq :credit_card_deactivated
          end
        end
      end
    end

    describe 'successful process' do
      before do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('order.submit')
        allow(dd_statsd).to receive(:increment).with('offer.submit')
        allow(Gravity).to receive(:get_artwork).with(artwork[:_id]).and_return(artwork)
        allow(Gravity).to receive(:get_credit_card).with(credit_card_id).and_return(credit_card)
        allow(Adapters::GravityV1).to receive(:get).with("/partner/#{seller_id}/all").and_return(gravity_v1_partner)
        expect(PostOrderNotificationJob).to receive(:perform_later).once.with(order.id, Order::SUBMITTED, buyer_id)
      end
      it 'submits the offer' do
        expect do
          call_service
          expect(order.reload.state).to eq(Order::SUBMITTED)
          expect(offer.reload.submitted_at).not_to be_nil
        end.to change(order.state_histories, :count).by(1)
      end

      it 'queues related jobs' do
        call_service
        expect(OrderFollowUpJob).to have_been_enqueued
        expect(ReminderFollowUpJob).to have_been_enqueued
      end

      it 'updates orders last_offer' do
        call_service
        expect(order.reload.last_offer).to eq offer
      end

      it 'updates order totals' do
        call_service
        expect(order.commission_fee_cents).to eq offer.amount_cents * 0.8 # comes from gravity_v1_partner
        expect(order.shipping_total_cents).to eq 30_00
        expect(order.tax_total_cents).to eq 20_00
        expect(order.buyer_total_cents).to eq 1000_00 + 30_00 + 20_00
        expect(order.transaction_fee_cents).to eq(offer.buyer_total_cents * 2.9 / 100 + 30)
      end
    end
  end

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
        expect_any_instance_of(OfferTotals).to receive_messages(shipping_total_cents: 100, tax_total_cents: 200, should_remit_sales_tax: false)
      end
      it 'adds a new offer to order and does not updates last offer' do
        OfferService.create_pending_offer(current_offer, amount_cents: 20000, from_id: offer_from_id, creator_id: offer_creator_id, from_type: offer_from_type)
        expect(order.offers.count).to eq(2)
        new_offer = order.offers.reject { |offer| offer.id == order.last_offer.id }.first
        expect(new_offer.amount_cents).to eq(20000)
        expect(new_offer.responds_to).to eq(current_offer)
        expect(new_offer.from_id).to eq(offer_from_id)
        expect(new_offer.creator_id).to eq(offer_creator_id)
        expect(new_offer.from_type).to eq(offer_from_type)
        expect(new_offer.submitted_at).to be_nil
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

  describe '#submit_new_offer!' do
    let(:artwork) { gravity_v1_artwork }
    let(:offer_from_id) { 'user-id' }
    let(:order_seller_id) { 'partner-1' }
    let(:order) { Fabricate(:order, mode: Order::OFFER, state: Order::SUBMITTED, seller_id: order_seller_id) }
    let(:line_item) { Fabricate(:line_item, order: order, artwork_id: artwork[:_id]) }
    let(:current_offer) { Fabricate(:offer, order: order, amount_cents: 10000, submitted_at: 1.day.ago) }
    let(:new_offer) { Fabricate(:offer, order: order, amount_cents: 200_00, shipping_total_cents: 100_00, tax_total_cents: 50_00, responds_to: current_offer, from_id: offer_from_id) }
    let(:call_service) { OfferService.submit_pending_offer(new_offer) }

    before do
      order.update!(last_offer: current_offer)
      order.line_items << line_item
      allow(Adapters::GravityV1).to receive(:get).with("/partner/#{order_seller_id}/all").and_return(gravity_v1_partner)
      allow(Adapters::GravityV1).to receive(:get).with("/artwork/#{line_item.artwork_id}").and_return(artwork)
    end

    context 'with counter on a submitted offer' do
      it 'submits the pending offer and updates last offer' do
        call_service
        expect(new_offer.submitted_at).not_to be_nil
      end

      it 'updates order last offer' do
        call_service
        expect(order.offers.count).to eq(2)
        expect(order.last_offer).to eq(new_offer)
        expect(order.last_offer.amount_cents).to eq(200_00)
        expect(order.last_offer.responds_to).to eq(current_offer)
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
      let(:new_offer) { Fabricate(:offer, order: order, amount_cents: 20000, responds_to: current_offer, submitted_at: 1.minute.ago, from_id: offer_from_id) }
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
      let(:new_offer) { Fabricate(:offer, order: order, amount_cents: 20000, responds_to: current_offer, submitted_at: 1.minute.ago, from_id: 'al-pachino') }
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
        expect(new_offer.submitted_at).not_to be_nil
      end
    end
  end

  def stub_ddstatsd_instance
    dd_statsd = double(Datadog::Statsd)
    allow(Exchange).to receive(:dogstatsd).and_return(dd_statsd)

    dd_statsd
  end
end
