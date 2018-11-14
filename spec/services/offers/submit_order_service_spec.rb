require 'rails_helper'

describe Offers::SubmitOrderService, type: :services do
  let(:user_id) { 'user-id' }
  let(:order_mode) { Order::OFFER }
  let(:order_state) { Order::PENDING }
  let(:offer_subitted_at) { nil }
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
  let(:credit_card_id) { 'grav_c_id1' }
  let(:order) { Fabricate(:order, mode: order_mode, state: order_state, credit_card_id: credit_card_id, **shipping_info) }
  let!(:offer) { Fabricate(:offer, order: order, submitted_at: offer_subitted_at) }
  let(:service) { described_class.new(offer, by: user_id) }
  describe '#process!' do
    describe 'failed process' do
      before do
        order.update!(last_offer: offer)
        expect(Exchange).not_to receive(:dogstatsd)
        expect(PostNotificationJob).not_to receive(:perform_later)
        expect(OrderFollowUpJob).not_to receive(:perform_later)
        expect(ReminderFollowUpJob).not_to receive(:perform_later)
      end

      context 'with already submitted offer' do
        let(:offer_subitted_at) { Time.now.utc }
        it 'raises invalid_offer error' do
          expect { service.process! }.to raise_error do |e|
            expect(e.type).to eq :validation
            expect(e.code).to eq :invalid_offer
          end
        end
      end

      context 'without shipping info' do
        let(:shipping_info) { {} }
        it 'raises missing_required_info error' do
          expect { service.process! }.to raise_error do |e|
            expect(e.type).to eq :validation
            expect(e.code).to eq :missing_required_info
          end
        end
      end

      context 'without payment info' do
        let(:credit_card_id) { nil }
        it 'raises missing_required_info error' do
          expect { service.process! }.to raise_error do |e|
            expect(e.type).to eq :validation
            expect(e.code).to eq :missing_required_info
          end
        end
      end

      context 'Buy order' do
        let(:order_mode) { Order::BUY }
        it 'raises cant_submit error' do
          expect { service.process! }.to raise_error do |e|
            expect(e.type).to eq :validation
            expect(e.code).to eq :cant_submit
          end
        end
      end

      Order::STATES.reject { |s| [Order::CANCELED, Order::PENDING].include? s }.each do |state|
        context "#{state} order" do
          let(:order_state) { state }
          it 'raises cant_submit error' do
            expect { service.process! }.to raise_error do |e|
              expect(e.type).to eq :validation
              expect(e.code).to eq :invalid_state
            end
          end
        end
      end
    end

    describe 'successful process' do
      before do
        order.update!(last_offer: offer)
        expect(Exchange).to receive_message_chain(:dogstatsd, :increment).with('order.submit')
        expect(PostNotificationJob).to receive(:perform_later).once.with(order.id, Order::SUBMITTED, user_id)
      end
      it 'submits the offer' do
        expect do
          service.process!
          expect(order.reload.state).to eq(Order::SUBMITTED)
          expect(offer.reload.submitted_at).not_to be_nil
        end.to change(order.state_histories, :count).by(1)
        expect(OrderFollowUpJob).to have_been_enqueued
        expect(ReminderFollowUpJob).to have_been_enqueued
      end
    end
  end
end
