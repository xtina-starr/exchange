require 'rails_helper'

describe Offers::CounterOfferService, type: :services do
  describe '#process!' do
    let(:order) { Fabricate(:order, state: Order::SUBMITTED) }
    let(:offer) { Fabricate(:offer, order: order, amount_cents: 10000) }
    let(:service) { Offers::CounterOfferService.new(offer: offer, amount_cents: 20000, from_type: Order::PARTNER) }
    let(:offer_totol_updater_service) { double }

    before do
      # last_offer is set in Orders::InitialOffer. "Stubbing" out the
      # dependent behavior of this class to by setting last_offer directly
      order.update!(last_offer: offer)

      allow(Offers::OfferTotalUpdaterService).to receive(:new).with(offer: instance_of(Offer)).and_return(offer_totol_updater_service)
      allow(offer_totol_updater_service).to receive(:process!)

    end

    context 'with a submitted offer' do
      it 'adds a new offer to order and updates last offer' do
        service.process!
        expect(order.offers.count).to eq(2)
        expect(order.last_offer.amount_cents).to eq(20000)
        expect(order.last_offer.responds_to).to eq(order.offers[0])
        expect(order.last_offer.submitted_at).not_to be_nil
      end

      it 'instruments an rejected offer' do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('offer.counter')

        service.process!

        expect(dd_statsd).to have_received(:increment).with('offer.counter')
      end
    end

    context 'attempting to counter not the last offer' do
      let!(:another_offer) { Fabricate(:offer, order: order) }

      before do
        # last_offer is set in Orders::InitialOffer. "Stubbing" out the
        # dependent behavior of this class to by setting last_offer directly
        order.update!(last_offer: another_offer)
      end

      it 'raises a validation error' do
        expect {  service.process! }
          .to raise_error(Errors::ValidationError)
      end

      it 'does not reject the order' do
        expect {  service.process! }.to raise_error(Errors::ValidationError)

        expect(order.reload.state).to eq(Order::SUBMITTED)
      end

      it 'does not instrument' do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('order.reject')

        expect {  service.process! }.to raise_error(Errors::ValidationError)

        expect(dd_statsd).to_not have_received(:increment)
      end
    end

    context 'attempting to counter its own offer' do
      let!(:offer) { Fabricate(:offer, order: order, from_type: Order::PARTNER) }

      it 'raises a validation error' do
        expect {  service.process! }
          .to raise_error(Errors::ValidationError)
      end

      it 'does not reject the order' do
        expect {  service.process! }.to raise_error(Errors::ValidationError)

        expect(order.reload.state).to eq(Order::SUBMITTED)
      end

      it 'does not instrument' do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('order.reject')

        expect {  service.process! }.to raise_error(Errors::ValidationError)

        expect(dd_statsd).to_not have_received(:increment)
      end
    end
  end

  def stub_ddstatsd_instance
    dd_statsd = double(Datadog::Statsd)
    allow(Exchange).to receive(:dogstatsd).and_return(dd_statsd)

    dd_statsd
  end
end
