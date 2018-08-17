require 'rails_helper'

describe RejectExpiredOrdersJob, type: :job do

  let(:order) { Fabricate(:order) }

  describe '#perform' do
    before do
      ActiveJob::Base.queue_adapter = :test
    end

    it 'rejects an order if the order has passed expiration time and is still in the same state' do
      order.update!(state_expires_at: Time.new - 1.second)
      RejectExpiredOrdersJob.perform_now(order.id, Order::PENDING)
      expect(order.state).to eq Order::REJECTED
    end

    it 'does not reject an order if the order is not in the same state' do
    end

    it 'does not reject an order if the order has not passed its expiration time' do
    end
  end
end
