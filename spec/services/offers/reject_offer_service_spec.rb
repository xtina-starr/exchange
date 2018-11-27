require 'rails_helper'

describe Offers::RejectOfferService, type: :services do
  describe '#process!' do
    let!(:order) { Fabricate(:order, state: Order::SUBMITTED) }
    let!(:offer) { Fabricate(:offer, order: order) }
    let(:service) { Offers::RejectOfferService.new(offer: offer, reject_reason: Order::REASONS[Order::CANCELED][:seller_rejected_offer_too_low]) }

    context 'with a submitted offer' do
      it 'updates the state of the order' do
        expect do
          service.process!
        end.to change { order.state }.from(Order::SUBMITTED).to(Order::CANCELED)
                                     .and change { order.state_reason }
          .from(nil).to(Order::REASONS[Order::CANCELED][:seller_rejected_offer_too_low])
      end

      it 'instruments an rejected offer' do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('offer.reject')

        service.process!

        expect(dd_statsd).to have_received(:increment).with('offer.reject')
      end
    end

    context "when we can't approve the order" do
      let(:order) { Fabricate(:order, state: Order::PENDING) }
      let(:offer) { Fabricate(:offer, order: order) }

      it "doesn't instrument" do
        dd_statsd = stub_ddstatsd_instance
        allow(dd_statsd).to receive(:increment).with('offer.reject')

        expect { service.process! }.to raise_error(Errors::ValidationError)

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
