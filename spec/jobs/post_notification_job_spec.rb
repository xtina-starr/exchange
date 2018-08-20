require 'rails_helper'

RSpec.describe PostNotificationJob, type: :job do
  let(:order) { Fabricate(:order) }
  it 'finds the order and posts the event' do
    action = Order::SUBMITTED
    expect(Artsy::EventService).to receive(:post_event).with(topic: 'commerce', event: instance_of(OrderEvent))
    PostNotificationJob.new.perform(order.id, action, order.user_id)
  end
end
