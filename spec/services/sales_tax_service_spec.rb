require 'rails_helper'
require 'support/gravity_helper'

describe SalesTaxService, type: :services do
  let(:taxjar_client) { double }
  let(:order) { Fabricate(:order, id: 1) }
  let!(:line_item) { Fabricate(:line_item, id: 1, order: order, list_price_cents: 2000_00, artwork_id: 'gravity_artwork_1', sales_tax_cents: 100) }
  let(:shipping_total_cents) { 2222 }
  let(:transaction_id) { "#{line_item.order.id}__#{line_item.id}" }
  let(:shipping) do
    {
      country: 'US',
      postal_code: '10013',
      region: 'NY',
      city: 'New York',
      address_line1: '123 Fake St'
    }
  end
  let(:shipping_address) { Address.new(shipping) }
  let!(:seller_locations) do
    [
      {
        country: 'US',
        state: 'NY',
        city: 'New York',
        address: '456 Fake St',
        postal_code: '10013'
      },
      {
        country: 'US',
        state: 'MA',
        city: 'Cambridge',
        address: '789 Fake St',
        postal_code: '02139'
      }
    ]
  end
  let!(:seller_addresses) { seller_locations.map { |ad| Address.new(ad) } }
  let(:artwork_location) { Address.new(gravity_v1_artwork[:location]) }
  let(:base_tax_params) do
    {
      amount: UnitConverter.convert_cents_to_dollars(line_item.list_price_cents),
      nexus_addresses: seller_addresses.map do |ad|
        {
          country: ad.country,
          zip: ad.postal_code,
          state: ad.region,
          city: ad.city,
          street: ad.street_line1
        }
      end,
      to_country: shipping_address.country,
      to_zip: shipping_address.postal_code,
      to_state: shipping_address.region,
      to_city: shipping_address.city,
      to_street: shipping_address.street_line1,
      shipping: 0
    }
  end
  let(:tax_response) { double(amount_to_collect: 3.00) }
  let(:tax_response_with_breakdown) { double(amount_to_collect: 3.00, breakdown: double(state_tax_collectable: 2.00)) }
  let(:untaxable_address) { Address.new(country: 'IR') }

  before do
    silence_warnings do
      SalesTaxService.const_set('REMITTING_STATES', ['fl'])
    end
    allow(Taxjar::Client).to receive(:new).with(api_key: Rails.application.config_for(:taxjar)['taxjar_api_key'], api_url: nil).and_return(taxjar_client)
    @service_ship = SalesTaxService.new(line_item, Order::SHIP, shipping_address, shipping_total_cents, artwork_location, seller_addresses)
    @service_pickup = SalesTaxService.new(line_item, Order::PICKUP, Address.new({}), shipping_total_cents, artwork_location, seller_addresses)
  end

  after do
    silence_warnings do
      SalesTaxService.const_set('REMITTING_STATES', [])
    end
  end

  describe '#initialize' do
    context 'with a destination address in a remitting state' do
      it 'sets seller_nexus_addresses to only be taxable seller addresses' do
        service = SalesTaxService.new(line_item, Order::SHIP, Address.new(shipping), shipping_total_cents, artwork_location, seller_addresses + [untaxable_address])
        expect(service.instance_variable_get(:@seller_nexus_addresses)).to eq seller_addresses
      end
    end
  end

  describe '#effective_shipping_total_cents' do
    context 'with a destination address in a remitting state' do
      it 'sets effective_shipping_total_cents to @shipping_total_cents' do
        shipping[:region] = 'FL'
        service = SalesTaxService.new(line_item, Order::SHIP, Address.new(shipping), shipping_total_cents, artwork_location, seller_addresses)
        expect(service.send(:effective_shipping_total_cents)).to eq shipping_total_cents
      end
    end
    context 'with a destination address in a non-remitting state' do
      it 'sets effective_shipping_total_cents to 0' do
        expect(@service_ship.send(:effective_shipping_total_cents)).to eq 0
      end
    end
  end

  describe '#sales_tax' do
    it 'calls fetch_sales_tax and returns the total amount to collect' do
      expect(@service_ship).to receive(:fetch_sales_tax).and_return(tax_response)
      expect(@service_ship.sales_tax).to eq 300
    end
    context 'with an error from TaxJar' do
      it 'raises a ProcessingError with a code of tax_calculator_failure' do
        expect(taxjar_client).to receive(:tax_for_order).and_raise(Taxjar::Error)
        expect { @service_ship.sales_tax }.to raise_error do |error|
          expect(error).to be_a Errors::ProcessingError
          expect(error.type).to eq :processing
          expect(error.code).to eq :tax_calculator_failure
        end
      end
    end
  end

  describe '#destination_address' do
    context 'with a fulfillment_type of SHIP' do
      context 'with a valid address' do
        it 'returns the shipping address' do
          expect(@service_ship.send(:destination_address)).to eq shipping_address
        end
      end
      context 'with an invalid address' do
        context 'with missing region' do
          it 'raises a missing_region error' do
            shipping[:region] = nil
            service = SalesTaxService.new(line_item, Order::SHIP, Address.new(shipping), shipping_total_cents, artwork_location, seller_addresses)
            expect { service.send(:destination_address) }.to raise_error do |error|
              expect(error).to be_a Errors::ValidationError
              expect(error.type).to eq :validation
              expect(error.code).to eq :missing_region
            end
          end
        end
        context 'with missing postal code' do
          it 'raises a missing_postal_code error' do
            shipping[:postal_code] = nil
            service = SalesTaxService.new(line_item, Order::SHIP, Address.new(shipping), shipping_total_cents, artwork_location, seller_addresses)
            expect { service.send(:destination_address) }.to raise_error do |error|
              expect(error).to be_a Errors::ValidationError
              expect(error.type).to eq :validation
              expect(error.code).to eq :missing_postal_code
            end
          end
        end
      end
    end
    context 'with a fulfillment_type of PICKUP' do
      context 'with a valid address' do
        it 'returns the origin address' do
          expect(@service_pickup.send(:destination_address)).to eq artwork_location
        end
      end
      context 'with an invalid address' do
        context 'with missing region' do
          it 'raises an invalid_artwork_address error' do
            invalid_artwork_location = Address.new(country: 'US', postal_code: '10013')
            service = SalesTaxService.new(line_item, Order::PICKUP, Address.new(shipping), shipping_total_cents, invalid_artwork_location, seller_addresses)
            expect { service.send(:destination_address) }.to raise_error do |error|
              expect(error).to be_a Errors::ValidationError
              expect(error.type).to eq :validation
              expect(error.code).to eq :invalid_artwork_address
            end
          end
        end
        context 'with missing postal code' do
          it 'raises an invalid_artwork_address error' do
            invalid_artwork_location = Address.new(country: 'US', region: 'NY')
            service = SalesTaxService.new(line_item, Order::PICKUP, Address.new(shipping), shipping_total_cents, invalid_artwork_location, seller_addresses)
            expect { service.send(:destination_address) }.to raise_error do |error|
              expect(error).to be_a Errors::ValidationError
              expect(error.type).to eq :validation
              expect(error.code).to eq :invalid_artwork_address
            end
          end
        end
      end
    end
  end

  describe '#fetch_sales_tax' do
    let(:params) do
      base_tax_params.merge(
        line_items: [
          {
            quantity: line_item.quantity,
            unit_price: UnitConverter.convert_cents_to_dollars(line_item.list_price_cents)
          }
        ]
      )
    end
    it 'calls the Taxjar API with the correct parameters' do
      allow(taxjar_client).to receive(:tax_for_order).with(params)
      @service_ship.send(:fetch_sales_tax)
      expect(taxjar_client).to have_received(:tax_for_order).with(params)
    end
  end

  describe '#record_tax_collected' do
    context 'when Artsy needs to remit taxes and line item has sales tax' do
      before do
        expect(@service_ship).to receive(:artsy_should_remit_taxes?).and_return(true)
      end
      it 'calls post_transaction and saves the result to @transaction' do
        expect(@service_ship).to receive(:post_transaction).and_return(double(transaction_id: '123'))
        @service_ship.record_tax_collected
        expect(@service_ship.transaction).to_not be_nil
      end
      context 'with an error from TaxJar' do
        before do
          order.submit!
          order.approve!
        end
        it 'raises a ProcessingError with a code of tax_recording_failure' do
          expect(taxjar_client).to receive(:create_order).and_raise(Taxjar::Error)
          expect { @service_ship.record_tax_collected }.to raise_error do |error|
            expect(error).to be_a Errors::ProcessingError
            expect(error.type).to eq :processing
            expect(error.code).to eq :tax_recording_failure
          end
        end
      end
    end
    context 'when Artsy does not need to remit taxes' do
      it 'does nothing' do
        expect(@service_ship).to receive(:artsy_should_remit_taxes?).and_return(false)
        expect(@service_ship).to_not receive(:post_transaction)
        @service_ship.record_tax_collected
      end
    end
    context 'when line item does not have sales tax' do
      it 'does nothing' do
        line_item.sales_tax_cents = 0
        service = SalesTaxService.new(line_item, Order::SHIP, shipping_address, shipping_total_cents, artwork_location, seller_addresses)
        allow(service).to receive(:artsy_should_remit_taxes?).and_return(true)
        allow(service).to receive(:post_transaction)
        service.record_tax_collected
        expect(service).to_not have_received(:post_transaction)
      end
    end
  end

  describe '#post_transaction' do
    let(:params) do
      base_tax_params.merge(
        transaction_id: transaction_id,
        transaction_date: line_item.order.last_approved_at.iso8601,
        sales_tax: UnitConverter.convert_cents_to_dollars(line_item.sales_tax_cents)
      )
    end
    before do
      # We need to trigger the state actions to generate the state history
      # necessary for `last_updated_at`
      order.submit!
      order.approve!
    end
    it 'calls the Taxjar API with the correct parameters' do
      expect(taxjar_client).to receive(:create_order).with(params)
      @service_ship.send(:post_transaction)
    end
  end

  describe '#artsy_should_remit_taxes?' do
    context 'with an order that has a US-based destination address' do
      context 'with a state where we are required to remit taxes' do
        it 'returns true' do
          SalesTaxService::REMITTING_STATES.each do |state|
            shipping[:region] = state
            service = SalesTaxService.new(line_item, Order::SHIP, Address.new(shipping), shipping_total_cents, artwork_location, seller_addresses)
            expect(service.send(:artsy_should_remit_taxes?)).to be true
          end
        end
      end
      context 'with a state other than a tax remitting state' do
        it 'returns false' do
          expect(@service_ship.send(:artsy_should_remit_taxes?)).to be false
        end
      end
    end
    context 'with an order that has a non-US destination address' do
      it 'returns false' do
        shipping[:country] = 'FR'
        service = SalesTaxService.new(line_item, Order::SHIP, Address.new(shipping), shipping_total_cents, artwork_location, seller_addresses)
        expect(service.send(:artsy_should_remit_taxes?)).to be false
      end
    end
  end

  describe '#refund_transaction' do
    context 'with an existing transaction in Taxjar' do
      it 'refunds the transaction' do
        expect(taxjar_client).to receive(:show_order).with(transaction_id).and_return(double)
        expect(@service_ship).to receive(:post_refund)
        @service_ship.refund_transaction(Time.new(2018, 1, 1))
      end
    end
    context 'without an existing transaction in Taxjar' do
      it 'does nothing' do
        expect(taxjar_client).to receive(:show_order).with(transaction_id).and_return(nil)
        expect(@service_ship).to_not receive(:post_refund)
        @service_ship.refund_transaction(Time.new(2018, 1, 1))
      end
    end
    context 'with an error from TaxJar' do
      it 'raises a ProcessingError with a code of tax_refund_failure' do
        expect(taxjar_client).to receive(:show_order).and_raise(Taxjar::Error)
        expect { @service_ship.refund_transaction(Time.new(2018, 1, 1)) }.to raise_error do |error|
          expect(error).to be_a Errors::ProcessingError
          expect(error.type).to eq :processing
          expect(error.code).to eq :tax_refund_failure
        end
      end
    end
  end

  describe '#get_transaction' do
    it "returns nil if TaxJar can't find the associated record" do
      expect(taxjar_client).to receive(:show_order).and_raise(Taxjar::Error::NotFound)
      expect(@service_ship.send(:get_transaction, 'tx_id')).to be_nil
    end
  end

  describe '#post_refund' do
    let(:transaction_date) { Time.new(2018, 1, 1) }
    let(:params) do
      base_tax_params.merge(
        transaction_id: "refund_#{transaction_id}",
        transaction_date: transaction_date.iso8601,
        transaction_reference_id: transaction_id,
        sales_tax: UnitConverter.convert_cents_to_dollars(line_item.sales_tax_cents)
      )
    end
    it 'calls the TaxJar API with the correct parameters' do
      expect(taxjar_client).to receive(:create_refund).with(params)
      @service_ship.send(:post_refund, transaction_date)
    end
  end

  describe '#construct_tax_params' do
    it 'returns the parameters shared by all API calls to TaxJar' do
      expect(@service_ship.send(:construct_tax_params)).to eq base_tax_params
    end
    it 'merges in additional data' do
      additional_data = { foo: 'bar' }
      expect(@service_ship.send(:construct_tax_params, additional_data)).to eq base_tax_params.merge(additional_data)
    end
  end

  describe '#address_taxable?' do
    context 'with a US-based address' do
      it 'returns true' do
        expect(@service_ship.send(:address_taxable?, Address.new(country: 'US', region: 'FL', postal_code: '12345'))).to eq true
      end
    end
    context 'with a non-US-based address' do
      it 'returns false' do
        expect(@service_ship.send(:address_taxable?, untaxable_address)).to eq false
      end
    end
  end

  describe '#process_nexus_addresses' do
    context 'with no addresses' do
      it 'raises an error' do
        expect { @service_ship.send(:process_nexus_addresses!, []) }.to raise_error do |error|
          expect(error).to be_a Errors::ValidationError
          expect(error.type).to eq :validation
          expect(error.code).to eq :no_taxable_addresses
        end
      end
    end
    context 'with no valid taxable addresses' do
      it 'raises an error' do
        expect { @service_ship.send(:process_nexus_addresses!, [untaxable_address]) }.to raise_error do |error|
          expect(error).to be_a Errors::ValidationError
          expect(error.type).to eq :validation
          expect(error.code).to eq :no_taxable_addresses
        end
      end
    end
    context 'with taxable addresses' do
      it 'filters out non-taxable addresses' do
        addresses = seller_addresses + [untaxable_address]
        expect(@service_ship.send(:process_nexus_addresses!, addresses)).to eq seller_addresses
      end
      it 'validates taxable addresses' do
        seller_addresses.each do |ad|
          expect(@service_ship).to receive(:validate_nexus_address!).with(ad)
        end
        @service_ship.send(:process_nexus_addresses!, seller_addresses)
      end
    end
  end
  context '#validate_nexus_address!' do
    context 'with an address with a missing region' do
      it 'raises an error' do
        invalid_address = Address.new(country: 'US')
        expect { @service_ship.send(:validate_nexus_address!, invalid_address) }.to raise_error do |error|
          expect(error).to be_a Errors::ValidationError
          expect(error.type).to eq :validation
          expect(error.code).to eq :invalid_seller_address
        end
      end
    end
  end
end
