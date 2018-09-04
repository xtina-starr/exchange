require 'rails_helper'
require 'support/gravity_helper'

describe SalesTaxService, type: :services do
  let(:taxjar_client) { double }
  let(:order) { Fabricate(:order) }
  let!(:line_item) { Fabricate(:line_item, order: order, price_cents: 2000_00, artwork_id: 'gravity_artwork_1', sales_tax_cents: 100) }
  let(:shipping_total_cents) { 2222 }
  let(:shipping) do
    {
      country: 'US',
      postal_code: 10013,
      region: 'NY',
      city: 'New York',
      address_line_1: '123 Fake St'
    }
  end
  let(:shipping_address) do
    {
      country: shipping[:country],
      postal_code: shipping[:postal_code],
      state: shipping[:region],
      city: shipping[:city],
      address: shipping[:address_line_1]
    }
  end
  let(:partner_location) do
    {
      country: 'US',
      state: 'NY',
      city: 'New York',
      address: '456 Fake St',
      postal_code: 10013
    }
  end
  let(:artwork_location) { gravity_v1_artwork[:location] }

  before do
    allow(Taxjar::Client).to receive(:new).with(api_key: Rails.application.config_for(:taxjar)['taxjar_api_key']).and_return(taxjar_client)
    @service_ship = SalesTaxService.new(line_item, Order::SHIP, shipping, shipping_total_cents, artwork_location)
    @service_pickup = SalesTaxService.new(line_item, Order::PICKUP, shipping, shipping_total_cents, artwork_location)
  end

  describe '#sales_tax' do
    it 'calls fetch_sales_tax and returns the sales tax in cents' do
      allow(GravityService).to receive(:fetch_partner_location).with(order.seller_id).and_return(partner_location)
      expect(@service_ship).to receive(:fetch_sales_tax).and_return(double(amount_to_collect: 1.00))
      expect(@service_ship.sales_tax).to eq 100
    end
  end

  describe '#seller_address' do
    it "returns the partner's location" do
      expect(GravityService).to receive(:fetch_partner_location).with(order.seller_id).and_return(partner_location)
      expect(@service_ship.send(:seller_address)).to eq partner_location
    end
  end

  describe '#origin_address' do
    context 'with a fulfillment_type of SHIP' do
      it 'returns the seller address' do
        expect(@service_ship).to receive(:seller_address).and_return(partner_location)
        expect(@service_ship.send(:origin_address)).to eq partner_location
      end
    end
    context 'with a fulfillment_type of PICKUP' do
      it 'returns the artwork location' do
        expect(@service_pickup.send(:origin_address)).to eq artwork_location
      end
    end
  end

  describe '#destination_address' do
    context 'with a fulfillment_type of SHIP' do
      it 'returns the shipping address' do
        expect(@service_ship.send(:destination_address)).to eq shipping_address
      end
    end
    context 'with a fulfillment_type of PICKUP' do
      it 'returns the origin address' do
        expect(@service_pickup).to receive(:origin_address).and_return(artwork_location)
        expect(@service_pickup.send(:destination_address)).to eq artwork_location
      end
    end
  end

  describe '#fetch_sales_tax' do
    let(:params) do
      {
        amount: UnitConverter.convert_cents_to_dollars(line_item.price_cents),
        from_country: partner_location[:country],
        from_zip: partner_location[:postal_code],
        from_state: partner_location[:state],
        from_city: partner_location[:city],
        from_street: partner_location[:address],
        to_country: shipping_address[:country],
        to_zip: shipping_address[:postal_code],
        to_state: shipping_address[:state],
        to_city: shipping_address[:city],
        to_street: shipping_address[:address],
        shipping: UnitConverter.convert_cents_to_dollars(shipping_total_cents)
      }
    end
    it 'calls the Taxjar API with the correct parameters' do
      allow(GravityService).to receive(:fetch_partner_location).with(order.seller_id).and_return(partner_location)
      allow(taxjar_client).to receive(:tax_for_order).with(params)
      @service_ship.send(:fetch_sales_tax)
      expect(taxjar_client).to have_received(:tax_for_order).with(params)
    end
  end

  describe '#record_tax_collected' do
    context 'when Artsy needs to remit taxes' do
      it 'calls post_transaction' do
        expect(@service_ship).to receive(:artsy_should_remit_taxes?).and_return(true)
        expect(@service_ship).to receive(:post_transaction)
        @service_ship.record_tax_collected
      end
    end
    context 'when Artsy does not need to remit taxes' do
      it 'does nothing' do
        expect(@service_ship).to receive(:artsy_should_remit_taxes?).and_return(false)
        expect(@service_ship).to_not receive(:post_transaction)
        @service_ship.record_tax_collected
      end
    end
  end

  describe '#post_transaction' do
    let(:params) do
      {
        transaction_id: line_item.id,
        transaction_date: line_item.order.last_approved_at.iso8601,
        amount: UnitConverter.convert_cents_to_dollars(line_item.price_cents),
        from_country: partner_location[:country],
        from_zip: partner_location[:postal_code],
        from_state: partner_location[:state],
        from_city: partner_location[:city],
        from_street: partner_location[:address],
        to_country: shipping_address[:country],
        to_zip: shipping_address[:postal_code],
        to_state: shipping_address[:state],
        to_city: shipping_address[:city],
        to_street: shipping_address[:address],
        sales_tax: UnitConverter.convert_cents_to_dollars(line_item.sales_tax_cents),
        shipping: UnitConverter.convert_cents_to_dollars(shipping_total_cents)
      }
    end
    before do
      # We need to trigger the state actions to generate the state history
      # necessary for `last_updated_at`
      order.submit!
      order.approve!
    end
    it 'calls the Taxjar API with the correct parameters' do
      allow(GravityService).to receive(:fetch_partner_location).with(order.seller_id).and_return(partner_location)
      expect(taxjar_client).to receive(:create_order).with(params)
      @service_ship.send(:post_transaction)
    end
  end

  describe '#artsy_should_remit_taxes?' do
    context 'with an order that has a US-based destination address' do
      context 'with a state of WA, NJ or PA' do
        it 'returns true' do
          %w[wa nj pa].each do |state|
            shipping[:region] = state
            service = SalesTaxService.new(line_item, Order::SHIP, shipping, shipping_total_cents, artwork_location)
            expect(service.send(:artsy_should_remit_taxes?)).to be true
          end
        end
      end
      context 'with a state other than WA, NJ or PA' do
        it 'returns false' do
          expect(@service_ship.send(:artsy_should_remit_taxes?)).to be false
        end
      end
    end
    context 'with an order that has a non-US destination address' do
      it 'returns false' do
        shipping[:country] = 'FR'
        service = SalesTaxService.new(line_item, Order::SHIP, shipping, shipping_total_cents, artwork_location)
        expect(service.send(:artsy_should_remit_taxes?)).to be false
      end
    end
  end
end
