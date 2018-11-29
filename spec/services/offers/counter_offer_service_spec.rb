require 'rails_helper'

describe Offers::CounterOfferService, type: :services do
  describe '#process!' do
    let!(:partner_id)  { 'partner-1' }
    let(:artwork_location) { {country: "US"}}
    let(:artwork) { { _id: 'a-1', current_version_id: '1', location: artwork_location, domestic_shipping_fee_cents: 1000 } }
    let!(:order) { Fabricate(:order, state: Order::SUBMITTED, seller_id: partner_id, **shipping_info) }
    let!(:offer) { Fabricate(:offer, order: order, amount_cents: 10000) }
    let(:line_item_artwork_version) { artwork[:current_version_id] }
    let!(:line_item) { Fabricate(:line_item, order: order, list_price_cents: 2000_00, artwork_id: artwork[:_id], artwork_version_id: line_item_artwork_version, quantity: 2) }
    let(:partner_address) do
      Address.new(
        street_line1: '401 Broadway',
        country: 'US',
        city: 'New York',
        region: 'NY',
        postal_code: '10013'
      )
    end
    let(:shipping_info) do
      {
        shipping_name: 'Fname Lname',
        shipping_address_line1: '12 Vanak St',
        shipping_address_line2: 'P 80',
        shipping_city: 'New York',
        shipping_postal_code: '02198',
        buyer_phone_number: '00123456',
        shipping_region: 'NY',
        shipping_country: 'US',
        fulfillment_type: Order::SHIP
      }
    end
    let(:taxjar_client) { double }
    let(:tax_response) { double(amount_to_collect: 3.00) }
    let(:service) { Offers::CounterOfferService.new(offer: offer, amount_cents: 20000, from_type: Order::PARTNER) }

    before do
      # last_offer is set in Orders::InitialOffer. "Stubbing" out the
      # dependent behavior of this class to by setting last_offer directly
      order.update!(last_offer: offer)

      allow(GravityService).to receive(:fetch_partner_locations).with(partner_id).and_return([partner_address])
      allow(GravityService).to receive(:get_artwork).and_return(artwork)
      allow(Taxjar::Client).to receive(:new).with(api_key: Rails.application.config_for(:taxjar)['taxjar_api_key'], api_url: nil).and_return(taxjar_client)
    end

    context 'with a submitted offer' do
      it 'adds a new offer to order and updates last offer' do
        expect(taxjar_client).to receive(:tax_for_order).with(any_args).and_return(tax_response)
        service.process!
        expect(order.offers.count).to eq(2)
        expect(order.last_offer.amount_cents).to eq(20000)
        expect(order.last_offer.responds_to).to eq(order.offers[0])
        expect(order.last_offer.submitted_at).not_to be_nil
      end

      it 'instruments an rejected offer' do
        expect(taxjar_client).to receive(:tax_for_order).with(any_args).and_return(tax_response)
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
