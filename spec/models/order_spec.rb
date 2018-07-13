require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { Fabricate(:order) }

  describe 'update_state_timestamps' do
    it 'sets state timestamps in create' do
      expect(order.state_updated_at).not_to be_nil
      expect(order.state_expires_at).to eq order.state_updated_at + 2.days
    end

    it 'does not update timestamps if state did not change' do
      current_timestamp = order.state_updated_at
      order.update!(currency_code: 'CAD')
      expect(order.state_updated_at).to eq current_timestamp
    end

    it 'updates timestamps if state changed to state with expiration' do
      current_timestamp = order.state_updated_at
      current_expiration = order.state_expires_at
      order.submit!
      order.save!
      expect(order.state_updated_at).not_to eq current_timestamp
      expect(order.state_expires_at).not_to eq current_expiration
    end
    it 'does not update expiration timestamp if state changed to state without expiration' do
      order.submit!
      order.save!
      submitted_timestamp = order.state_updated_at
      order.approve!
      order.save!
      expect(order.state_updated_at).not_to eq submitted_timestamp
      expect(order.state_expires_at).to be_nil
    end
  end

  describe '#items_total_cents' do
    context 'with no line items' do
      it 'returns 0' do
        expect(order.items_total_cents).to eq 0
      end
    end

    context 'with one line item' do
      it 'returns the price for that line item' do
        Fabricate :line_item, order: order, price_cents: 500_00
        expect(order.items_total_cents).to eq 500_00
      end
    end

    context 'with a couple line items' do
      it 'returns the sum of the prices of those line items' do
        Fabricate.times 2, :line_item, order: order, price_cents: 123_00
        expect(order.items_total_cents).to eq 246_00
      end
    end

    context 'with a line item that has no price' do
      it 'returns 0' do
        Fabricate :line_item, order: order, price_cents: nil
        expect(order.items_total_cents).to eq 0
      end
    end
  end

  describe '#shipping_info' do
    context 'with Ship fulfillment type' do
      it 'returns true when all required shipping data available' do
        order.update!(fulfillment_type: Order::PICKUP, shipping_country: 'IR', shipping_address_line1: 'Vanak', shipping_address_line2: nil, shipping_postal_code: '09821', shipping_city: 'Tehran')
        expect(order.shipping_info?).to be true
      end
      it 'returns false if missing any shipping data' do
        order.update!(fulfillment_type: Order::SHIP, shipping_country: 'IR', shipping_address_line1: nil, shipping_postal_code: nil)
        expect(order.shipping_info?).to be false
      end
    end
    context 'with Pickup fulfillment type' do
      it 'returns true' do
        order.update!(fulfillment_type: Order::PICKUP, shipping_country: nil, shipping_address_line1: nil, shipping_postal_code: nil)
        expect(order.shipping_info?).to be true
      end
    end
  end
end
