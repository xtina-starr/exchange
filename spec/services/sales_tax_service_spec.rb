require 'rails_helper'
require 'support/taxjar_helper'
require 'support/gravity_helper'

describe SalesTaxService, type: :services do
  let(:order) { Fabricate(:order) }
  let!(:line_items) { [Fabricate(:line_item, order: order, price_cents: 2000_00, artwork_id: 'gravity_artwork_1'), Fabricate(:line_item, order: order, price_cents: 8000_00)] }
  let(:fulfillment_type) { Order::SHIP }
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
  let(:artwork_location) do
    gravity_v1_artwork[:location]
  end

  before do
    stub_tax_for_order
  end

  describe '#calculate_total_sales_tax' do
    before do
      allow(GravityService).to receive(:fetch_partner_location).with(order.partner_id).and_return(partner_location)
      allow(SalesTaxService).to receive(:calculate_line_item_sales_tax).twice.and_return(1000)
    end
    it "fetches the partner's location" do
      SalesTaxService.calculate_total_sales_tax(order, fulfillment_type, shipping, shipping_total_cents)
      expect(GravityService).to have_received(:fetch_partner_location).with(order.partner_id)
    end
    it 'calculates sales tax for each line item and adds them together' do
      expect(SalesTaxService.calculate_total_sales_tax(order, fulfillment_type, shipping, shipping_total_cents)).to be 2000
      expect(SalesTaxService).to have_received(:calculate_line_item_sales_tax).with(line_items[0], partner_location, shipping_address, shipping_total_cents, fulfillment_type)
      expect(SalesTaxService).to have_received(:calculate_line_item_sales_tax).with(line_items[1], partner_location, shipping_address, shipping_total_cents, fulfillment_type)
    end
  end

  describe '#calculate_line_item_sales_tax' do
    let(:sales_tax_double) { double(amount_to_collect: 1.16) }
    before do
      allow(GravityService).to receive(:get_artwork).with('gravity_artwork_1').and_return(gravity_v1_artwork)
    end
    it 'fetches the artwork on the line item' do
      SalesTaxService.calculate_line_item_sales_tax(line_items[0], partner_location, shipping_address, shipping_total_cents, fulfillment_type)
      expect(GravityService).to have_received(:get_artwork).with(line_items[0].artwork_id)
    end
    context 'with an order to be picked up' do
      it 'sets the destination address to the origin address and calls fetch_sale_tax' do
        allow(SalesTaxService).to receive(:fetch_sales_tax).with(line_items[0].price_cents, partner_location, artwork_location, artwork_location, shipping_total_cents).and_return(sales_tax_double)
        SalesTaxService.calculate_line_item_sales_tax(line_items[0], partner_location, shipping_address, shipping_total_cents, Order::PICKUP)
        expect(SalesTaxService).to have_received(:fetch_sales_tax).with(line_items[0].price_cents, partner_location, artwork_location, artwork_location, shipping_total_cents)
      end
    end
    context 'with an order to be shipped' do
      it 'sets the destination address to the shipping address and calls fetch_sales_tax' do
        allow(SalesTaxService).to receive(:fetch_sales_tax).with(line_items[0].price_cents, partner_location, artwork_location, shipping_address, shipping_total_cents).and_return(sales_tax_double)
        SalesTaxService.calculate_line_item_sales_tax(line_items[0], partner_location, shipping_address, shipping_total_cents, Order::SHIP)
        expect(SalesTaxService).to have_received(:fetch_sales_tax).with(line_items[0].price_cents, partner_location, artwork_location, shipping_address, shipping_total_cents)
      end
    end
    it 'returns the amount of sales tax to be collected in cents' do
      line_item_sales_tax = SalesTaxService.calculate_line_item_sales_tax(line_items[0], partner_location, shipping_address, shipping_total_cents, fulfillment_type)
      expect(line_item_sales_tax).to eq 116
    end
  end

  describe '#fetch_sales_tax' do
    let(:taxjar_client) { double }
    let(:params) do
      {
        amount: UnitConverter.convert_cents_to_dollars(line_items[0].price_cents),
        from_country: artwork_location[:country],
        from_zip: artwork_location[:postal_code],
        from_state: artwork_location[:state],
        from_city: artwork_location[:city],
        from_street: artwork_location[:address],
        to_country: shipping_address[:country],
        to_zip: shipping_address[:postal_code],
        to_state: shipping_address[:state],
        to_city: shipping_address[:city],
        to_street: shipping_address[:address],
        nexus_addresses: [
          {
            country: partner_location[:country],
            zip: partner_location[:postal_code],
            state: partner_location[:state],
            city: partner_location[:city],
            street: partner_location[:address]
          }
        ],
        shipping: UnitConverter.convert_cents_to_dollars(shipping_total_cents)
      }
    end
    before do
      allow(Taxjar::Client).to receive(:new).with(api_key: Rails.application.config_for(:taxjar)['taxjar_api_key']).and_return(taxjar_client)
    end
    it 'calls the Taxjar API with the correct parameters' do
      allow(taxjar_client).to receive(:tax_for_order).with(params)
      SalesTaxService.fetch_sales_tax(line_items[0].price_cents, partner_location, artwork_location, shipping_address, shipping_total_cents)
      expect(taxjar_client).to have_received(:tax_for_order).with(params)
    end
  end
end
