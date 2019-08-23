require 'rails_helper'
require 'support/gravity_helper'

describe OfferProcessor, type: :services do
  include_context 'include stripe helper'

  let(:order) { Fabricate(:order, seller_id: 'partner_1', buyer_id: 'user_1', state: Order::PENDING, mode: Order::OFFER) }
  let(:offer) { Fabricate(:offer, amount_cents: 200, order: order) }
  let(:op) { OfferProcessor.new(offer) }

  describe '#validate_offer!' do
    it 'raises error when offer already submitted' do
      offer.update!(submitted_at: Time.now.utc)
      expect{ op.validate_offer! }.to raise_error(Errors::ValidationError)
    end
    it 'does not raise error when order is not submitted' do
      expect{ op.validate_offer! }.not_to raise_error
    end
  end

  describe '#check_inventory!' do
    it 'raises error when there are no inventory' do
      allow(order).to receive(:inventory?).and_return(false)
      expect{ op.check_inventory! }.to raise_error(Errors::InsufficientInventoryError)
    end
    it 'does not raise error' do
      allow(order).to receive(:inventory?).and_return(true)
      expect{ op.check_inventory! }.not_to raise_error
    end
  end

  describe '#validate_order!' do
    it 'raises error when its a buy order' do
      order.update!(mode: Order::BUY)
      expect { op.validate_order! }.to raise_error(Errors::ValidationError)
    end
    it 'raises error when order not committable' do
      allow(order).to receive(:can_commit?).and_return(false)
      expect { op.validate_order! }.to raise_error(Errors::ValidationError)
    end
    it 'raises error when invalid artwork version' do
      allow(order).to receive(:valid_artwork_version?).and_return(false)
      expect { op.validate_order! }.to raise_error(Errors::ValidationError)
    end
    it 'raises error when invalid credit card' do
      allow(order).to receive(:assert_credit_card).and_return(:credit_card_missing_external_id)
      expect { op.validate_order! }.to raise_error(Errors::ValidationError)
    end
    it 'does not raise error Oif all good and sunny' do
      allow(order).to receive_messages(
        :can_commit? => true,
        :valid_artwork_version? => true,
        :assert_credit_card => nil
      )
      expect { op.validate_order! }.not_to raise_error
    end
  end

  describe '#submit_order!' do
    it 'submits the order' do
      op.submit_order!
      expect(order.reload.state).to eq Order::SUBMITTED
    end
  end

  describe '#confirm_payment_method!' do
  end

  describe '#update_offer_submission_timestamp' do
  end

  describe '#on_success!' do
  end

  describe '#order_on_success!' do
  end
end
