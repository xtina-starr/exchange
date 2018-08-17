require 'rails_helper'

describe ExpireOrderJob, type: :job do

  let(:order) { Fabricate(:order) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end
  
  describe '#perform' do
    context 'with an expired order' do
      it 'transitions a pending order to an abandoned' do
        allow(OrderService).to receive(:abandon!).with(order)
        order.update!(state_expires_at: Time.new - 1.second)
        ExpireOrderJob.perform_now(order.id, Order::PENDING)
        expect(OrderService).to have_received(:abandon!).with(order)
      end
      it 'transitions a submitted order to rejected order' do
      end
      it 'transitions an approved order to rejected' do
      end
    end
    context 'with an order in a different state' do
      it 'does nothing' do
      end
    end
    context 'with an order in the same state before its expiration time' do
      it 'does nothing'
    end
  end
end
