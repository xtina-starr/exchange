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
      order.reject!
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
        order.update!(fulfillment_type: Order::PICKUP, shipping_name: 'Fname Lname', shipping_country: 'IR', shipping_address_line1: 'Vanak', shipping_address_line2: nil, shipping_postal_code: '09821', shipping_city: 'Tehran')
        expect(order.shipping_info?).to be true
      end
      it 'returns false if missing any shipping data' do
        order.update!(fulfillment_type: Order::SHIP, shipping_name: 'Fname Lname', shipping_country: 'IR', shipping_address_line1: nil, shipping_postal_code: nil)
        expect(order.shipping_info?).to be false
      end
    end
    context 'with Pickup fulfillment type' do
      it 'returns true' do
        order.update!(fulfillment_type: Order::PICKUP, shipping_name: 'Fname Lname', shipping_country: nil, shipping_address_line1: nil, shipping_postal_code: nil)
        expect(order.shipping_info?).to be true
      end
    end
  end

  describe '#seller_total_cents' do
    before do
      Fabricate.times 2, :line_item, order: order, price_cents: 100_00
    end
    it 'returns correct seller_total_cents' do
      order.update!(tax_total_cents: 50_00, shipping_total_cents: 50_00, commission_fee_cents: 20_00, transaction_fee_cents: 20_00)
      expect(order.reload.seller_total_cents).to eq 260_00
    end
    context 'without commission fee' do
      it 'returns correct total cents' do
        order.update!(tax_total_cents: 50_00, shipping_total_cents: 50_00, commission_fee_cents: nil, transaction_fee_cents: 20_00)
        expect(order.reload.seller_total_cents).to eq 280_00
      end
    end
    context 'without transaction fee' do
      it 'returns correct total cents' do
        order.update!(tax_total_cents: 50_00, shipping_total_cents: 50_00, commission_fee_cents: 20_00, transaction_fee_cents: nil)
        expect(order.reload.seller_total_cents).to eq 280_00
      end
    end
  end

  describe '#buyer_total_cents' do
    context 'without shipping total cents' do
      it 'returns tax + line items' do
        Fabricate.times 2, :line_item, order: order, price_cents: 100_00
        order.update!(tax_total_cents: 100_00)
        expect(order.buyer_total_cents).to eq 300_00
      end
    end
    context 'without tax total cents' do
      it 'returns tax + line items' do
        Fabricate.times 2, :line_item, order: order, price_cents: 100_00
        order.update!(shipping_total_cents: 100_00)
        expect(order.buyer_total_cents).to eq 300_00
      end
    end
    context 'with shipping/tax and line items' do
      it 'returns shipping + tax + line items' do
        Fabricate.times 2, :line_item, order: order, price_cents: 100_00
        order.update!(shipping_total_cents: 100_00, tax_total_cents: 50_00)
        expect(order.buyer_total_cents).to eq 350_00
      end
    end
  end

  describe '#code' do
    it 'sets code in proper format' do
      expect(order.code).to match(/^B\d{6}$/)
    end
  end

  describe '#create_state_history' do
    context 'when an order is first created' do
      it 'creates a new state history object with its initial state' do
        new_order = Order.create!(state: Order::PENDING)
        expect(new_order.state_histories.count).to eq 1
        expect(new_order.state_histories.last.state).to eq Order::PENDING
        expect(new_order.state_histories.last.updated_at).to eq new_order.state_updated_at
      end
    end
    context 'when an order changes state' do
      it 'creates a new state history object with the new state' do
        order.submit!
        expect(order.state_histories.count).to eq 2 # PENDING and SUBMITTED
        expect(order.state_histories.last.state).to eq Order::SUBMITTED
        expect(order.state_histories.last.updated_at).to eq order.state_updated_at
      end
    end
  end

  describe '#submitted_at' do
    context 'with a submitted order' do
      it 'returns the time at which the order was submitted' do
        order.submit!
        expect(order.submitted_at).to eq order.state_histories.find_by(state: Order::SUBMITTED).updated_at
      end
    end
    context 'with an unsubmitted order' do
      it 'returns nil' do
        expect(order.submitted_at).to be_nil
      end
    end
  end

  describe '#approved_at' do
    context 'with an approved order' do
      it 'returns the time at which the order was approved' do
        order.update!(state: Order::SUBMITTED)
        order.approve!
        expect(order.approved_at).to eq order.state_histories.find_by(state: Order::APPROVED).updated_at
      end
    end
    context 'with an un-approved order' do
      it 'returns nil' do
        expect(order.approved_at).to be_nil
      end
    end
  end
end
