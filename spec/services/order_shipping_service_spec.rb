require 'rails_helper'
require 'support/gravity_helper'

describe OrderShippingService, type: :services do
  let(:order_mode) { Order::BUY }
  let(:order) { Fabricate(:order) }
  let(:continental_us_order) { Fabricate(:order, mode: order_mode) }
  let(:domestic_shipping) do
    {
      address_line1: '401 Broadway',
      country: 'US',
      city: 'New York',
      region: 'NY',
      postal_code: '10013'
    }
  end
  let(:non_continental_us_shipping) do
    {
      address_line1: '3101 A St',
      country: 'US',
      city: 'Anchorage',
      region: 'AK',
      postal_code: '99503'
    }
  end
  let(:international_shipping) do
    {
      address_line1: "14 Gower's Walk",
      address_line2: 'Suite 2.5, The Loom',
      city: 'Whitechapel',
      region: 'London',
      postal_code: 'E1 8PY',
      country: 'GB'
    }
  end
  let(:domestic_artwork_config) do
    {
      _id: 'a-1',
      domestic_shipping_fee_cents: 100_00,
      international_shipping_fee_cents: 500_00,
      location: artwork_location
    }
  end
  let(:continental_us_artwork_config) do
    {
      _id: 'a-2',
      domestic_shipping_fee_cents: 100_00,
      international_shipping_fee_cents: nil,
      location: artwork_location
    }
  end
  let(:artwork_location) do
    {
      country: 'US',
      city: 'Brooklyn',
      state: 'NY'
    }
  end
  let(:artwork) { gravity_v1_artwork(domestic_artwork_config) }
  let(:continental_us_artwork) { gravity_v1_artwork(continental_us_artwork_config) }

  before do
    @service_domestic_shipping = OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: domestic_shipping)
    @service_international_shipping = OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: international_shipping)
    @service_continental_us_shipping = OrderShippingService.new(continental_us_order, fulfillment_type: Order::SHIP, shipping: non_continental_us_shipping)
  end

  describe '#process!' do
    context 'with domestic only shipping' do
      let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: 'a-1') }
      let!(:continental_us_line_item) { Fabricate(:line_item, order: continental_us_order, artwork_id: 'a-2') }
      context 'with non-continental US shipping address' do
        it 'raises error' do
          allow_any_instance_of(OrderHelper).to receive(:artworks).and_return('a-2' => continental_us_artwork)
          expect { @service_continental_us_shipping.process! }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq(:unsupported_shipping_location)
            expect(error.data[:failure_code]).to eq :domestic_shipping_only
          end
        end
      end
      context 'with international shipping address' do
        it 'raises error' do
          allow_any_instance_of(OrderHelper).to receive(:artworks).and_return('a-1' => continental_us_artwork)
          expect { @service_international_shipping.process! }.to raise_error do |error|
            expect(error).to be_a(Errors::ValidationError)
            expect(error.code).to eq(:unsupported_shipping_location)
            expect(error.data[:failure_code]).to eq :domestic_shipping_only
          end
        end
      end
    end

    describe 'tax' do
      let(:artwork) { gravity_v1_artwork }
      let(:partner) { { _id: 'partner-1', artsy_collects_sales_tax: artsy_collects_sales_tax } }
      let(:order) { Fabricate(:order, seller_id: partner[:_id], mode: order_mode) }
      let(:line_items) { Array.new(2) { Fabricate(:line_item, order: order, artwork_id: artwork[:_id]) } }
      let(:tax_calculator) { double('Tax Calculator', sales_tax: 3750, artsy_should_remit_taxes?: false) }
      let(:service) { OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: domestic_shipping) }
      let(:artsy_collects_sales_tax) { true }

      before do
        expect(Gravity).to receive_messages(fetch_partner: partner, fetch_partner_locations: [], get_artwork: artwork)
        expect(Tax::CalculatorService).to receive(:new)
          .exactly(line_items.count).times.and_return(tax_calculator)
        allow_any_instance_of(ShippingCalculatorService).to receive(:shipping_cents).and_return(0)
        line_items
        service.process!
      end

      context 'Buy Order' do
        context 'artsy collects sales tax' do
          it 'sets sales_tax_cents on line items from tax calculator' do
            order.line_items.each do |line_item|
              expect(line_item.sales_tax_cents).to eq 3750
            end
          end

          it 'sets tax_total_cents on order' do
            expect(order.tax_total_cents).to eq 3750 * line_items.count
          end
        end

        context 'seller opts out of tax collection' do
          let(:artsy_collects_sales_tax) { false }

          it 'sets sales_tax_cents on line items to 0' do
            order.line_items.each do |line_item|
              expect(line_item.sales_tax_cents).to eq 0
            end
          end

          it 'sets tax_total_cents on order 0' do
            expect(order.tax_total_cents).to eq 0
          end
        end
      end

      context 'Offer Order' do
        let(:order_mode) { Order::OFFER }
        let(:line_items) { [Fabricate(:line_item, order: order, artwork_id: artwork[:_id])] }
        let(:pending_offer) { Fabricate(:offer, order: order, amount_cents: 20000) }
        let(:service) { OrderShippingService.new(order, fulfillment_type: Order::SHIP, shipping: domestic_shipping, pending_offer: pending_offer) }

        context 'artsy collects sales tax' do
          it 'does not set sales_tax_cents on line items' do
            order.line_items.each do |line_item|
              expect(line_item.sales_tax_cents).to be_nil
            end
          end

          it 'does not set tax_total_cents on order' do
            expect(order.tax_total_cents).to be_nil
          end

          it 'sets tax_total_cents on pending offer from tax calculator' do
            expect(pending_offer.tax_total_cents).to eq 3750 * line_items.count
          end
        end

        context 'seller opts out of tax collection' do
          let(:artsy_collects_sales_tax) { false }

          it 'does not set sales_tax_cents on line items' do
            line_items.each do |line_item|
              expect(line_item.sales_tax_cents).to be_nil
            end
          end

          it 'does not set tax_total_cents on order' do
            expect(order.tax_total_cents).to be_nil
          end

          it 'sets tax_total_cents on pending offer to 0' do
            expect(pending_offer.tax_total_cents).to eq 0
          end
        end
      end
    end
  end
end
