require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { Fabricate(:order) }

  describe 'validate currency' do
    it 'raises invalid record for unsupported currencies' do
      expect { order.update!(currency_code: 'CAD') }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Currency code is not included in the list')
    end
  end

  describe 'validates state_reason' do
    context 'state requiring reasons' do
      it 'raises error when missing reason for states with required reason' do
        expect do
          order.update!(state: Order::CANCELED)
        end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: State reason Invalid state reason')
      end
      it 'raises error when providing unknown reasons' do
        expect do
          order.update!(state: Order::CANCELED, state_reason: 'random reason')
        end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: State reason Invalid state reason')
      end
      it 'sets state and reason with correct state and reason' do
        order.update!(state: Order::CANCELED, state_reason: Order::REASONS[Order::CANCELED][:seller_lapsed])
        expect(order.reload.state).to eq Order::CANCELED
        expect(order.reload.state_reason).to eq Order::REASONS[Order::CANCELED][:seller_lapsed]
      end
      it 'sets state reason on state history records' do
        order.update!(state: Order::SUBMITTED)
        expect { order.seller_lapse! }.to change(order.state_histories, :count).by(1)
        expect(order.state_histories.last.state).to eq Order::CANCELED
        expect(order.state_histories.last.reason).to eq Order::REASONS[Order::CANCELED][:seller_lapsed]
      end
    end
    context 'state not requiring reason' do
      it 'sets the state' do
        order.update!(state: Order::ABANDONED)
        expect(order.state).to eq Order::ABANDONED
        expect(order.state_reason).to be_nil
      end
      it 'adds proper state history' do
        expect { order.submit! }.to change(order.state_histories, :count).by(1)
        expect(order.state_histories.last.state).to eq Order::SUBMITTED
        expect(order.state_histories.last.reason).to be_nil
      end
      it 'raises error when setting reason' do
        expect do
          order.update!(state: Order::SUBMITTED, state_reason: Order::REASONS[Order::CANCELED][:seller_lapsed])
        end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: State reason Current state not expecting reason: submitted')
      end
    end
  end

  describe 'update_state_timestamps' do
    it 'sets state timestamps in create' do
      expect(order.state_updated_at).not_to be_nil
      expect(order.state_expires_at).to eq order.state_updated_at + 2.days
    end

    it 'does not update timestamps if state did not change' do
      current_timestamp = order.state_updated_at
      order.update!(shipping_total_cents: 12313)
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

  describe '#shipping_info' do
    context 'with Ship fulfillment type' do
      it 'returns true when all required shipping data available' do
        order.update!(fulfillment_type: Order::PICKUP, shipping_name: 'Fname Lname', shipping_country: 'IR', shipping_address_line1: 'Vanak', shipping_address_line2: nil, shipping_postal_code: '09821', buyer_phone_number: '0923', shipping_city: 'Tehran')
        expect(order.shipping_info?).to be true
      end
      it 'returns false if missing any shipping data' do
        order.update!(fulfillment_type: Order::SHIP, shipping_name: 'Fname Lname', shipping_country: 'IR', shipping_address_line1: nil, shipping_postal_code: nil, buyer_phone_number: nil)
        expect(order.shipping_info?).to be false
      end
    end
    context 'with Pickup fulfillment type' do
      it 'returns true' do
        order.update!(fulfillment_type: Order::PICKUP, shipping_name: 'Fname Lname', shipping_country: nil, shipping_address_line1: nil, shipping_postal_code: nil, buyer_phone_number: nil)
        expect(order.shipping_info?).to be true
      end
    end
  end

  describe '#update_code' do
    it 'raises an error if it is unable to set a code within specified attempts' do
      expect do
        order.send(:update_code, 0)
      end.to raise_error do |error|
        expect(error).to be_a(Errors::ValidationError)
        expect(error.code).to eq :failed_order_code_generation
      end
    end

    it 'sets a 0-padded 9 digit number for the code on order creation' do
      expect(order.code.length).to eq 9
      expect(order.code).to eq format('%09d', order.code.to_i)
    end
  end

  describe '#create_state_history' do
    context 'when an order is first created' do
      it 'creates a new state history object with its initial state' do
        new_order = Order.create!(state: Order::PENDING, currency_code: 'USD')
        expect(new_order.state_histories.count).to eq 1
        expect(new_order.state_histories.last.state).to eq Order::PENDING
        expect(new_order.state_histories.last.updated_at.to_i).to eq new_order.state_updated_at.to_i
      end
    end
    context 'when an order changes state' do
      it 'creates a new state history object with the new state' do
        order.submit!
        expect(order.state_histories.count).to eq 2 # PENDING and SUBMITTED
        expect(order.state_histories.last.state).to eq Order::SUBMITTED
        expect(order.state_histories.last.updated_at.to_i).to eq order.state_updated_at.to_i
      end
    end
  end

  describe '#last_submitted_at' do
    context 'with a submitted order' do
      it 'returns the time at which the order was submitted' do
        order.submit!
        expect(order.last_submitted_at.to_i).to eq order.state_histories.find_by(state: Order::SUBMITTED).updated_at.to_i
      end
    end
    context 'with an unsubmitted order' do
      it 'returns nil' do
        expect(order.last_submitted_at).to be_nil
      end
    end
  end

  describe '#last_approved_at' do
    context 'with an approved order' do
      it 'returns the time at which the order was approved' do
        order.update!(state: Order::SUBMITTED)
        order.approve!
        expect(order.last_approved_at.to_i).to eq order.state_histories.find_by(state: Order::APPROVED).updated_at.to_i
      end
    end
    context 'with an un-approved order' do
      it 'returns nil' do
        expect(order.last_approved_at).to be_nil
      end
    end
  end

  describe 'scope_validate' do
    Order::STATES.reject { |state| state == Order::CANCELED }.each do |state|
      let!("#{state}_order".to_sym) { Fabricate(:order, state: state) }
    end
    let!(:canceled_order) { Fabricate(:order, state: Order::CANCELED, state_reason: 'seller_lapsed') }
    describe 'active' do
      it 'returns only active order' do
        orders = Order.active
        expect(orders.count).to eq 2
        expect(orders).to match_array([approved_order, submitted_order])
      end
    end
    describe 'approved' do
      it 'returns only approved order' do
        orders = Order.approved
        expect(orders.count).to eq 1
        expect(orders.first).to eq approved_order
      end
    end
  end
end
