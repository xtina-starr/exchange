require 'rails_helper'

describe OrderEvent, type: :events do
  before { Timecop.freeze(Time.parse('2018-08-16 15:48:00 -0400')) }
  after { Timecop.return }
  let(:partner_id) { 'partner-1' }
  let(:user_id) { 'user-1' }
  let(:shipping_info) do
    {
      shipping_name: 'Fname Lname',
      shipping_address_line1: '123 Main St',
      shipping_address_line2: 'Apt 2',
      shipping_city: 'Chicago',
      shipping_country: 'USA',
      shipping_postal_code: '60618',
      shipping_region: 'IL'
    }
  end
  let(:order) do
    Fabricate(:order,
              seller_id: partner_id,
              buyer_id: user_id,
              buyer_type: Order::USER,
              seller_type: Order::PARTNER,
              currency_code: 'usd',
              shipping_total_cents: 50,
              tax_total_cents: 30,
              **shipping_info)
  end
  let!(:line_items) do
    [
      Fabricate(:line_item, price_cents: 200, order: order),
      Fabricate(:line_item, price_cents: 100, order: order)
    ]
  end
  let(:event) { OrderEvent.new(user: user_id, action: Order::SUBMITTED, model: order) }

  describe 'post' do
    it 'calls ArtsyEventService to post event' do
      expect(Artsy::EventService).to receive(:post_event).with(topic: 'commerce', event: instance_of(OrderEvent))
      OrderEvent.post(order, Order::SUBMITTED, user_id)
    end
  end

  describe '#subject' do
    it 'returns user id' do
      expect(event.subject[:id]).to eq user_id
    end
  end

  describe '#object' do
    it 'returns order id' do
      expect(event.object[:id]).to eq order.id.to_s
    end
  end

  describe '#properties' do
    it 'returns correct properties for a submitted order' do
      order.submit!
      order.save!
      expect(event.properties[:seller_id]).to eq partner_id
      expect(event.properties[:code]).to eq order.code
      expect(event.properties[:currency_code]).to eq 'usd'
      expect(event.properties[:state]).to eq 'submitted'
      expect(event.properties[:seller_type]).to eq Order::PARTNER
      expect(event.properties[:buyer_type]).to eq Order::USER
      expect(event.properties[:items_total_cents]).to eq 300
      expect(event.properties[:shipping_total_cents]).to eq 50
      expect(event.properties[:tax_total_cents]).to eq 30
      expect(event.properties[:buyer_total_cents]).to eq 380
      expect(event.properties[:updated_at]).not_to be_nil
      expect(event.properties[:created_at]).not_to be_nil
      expect(event.properties[:line_items].count).to eq 2
      expect(event.properties[:shipping_name]).to eq 'Fname Lname'
      expect(event.properties[:shipping_address_line1]).to eq '123 Main St'
      expect(event.properties[:shipping_address_line2]).to eq 'Apt 2'
      expect(event.properties[:shipping_city]).to eq 'Chicago'
      expect(event.properties[:shipping_country]).to eq 'USA'
      expect(event.properties[:shipping_postal_code]).to eq '60618'
      expect(event.properties[:shipping_region]).to eq 'IL'
      expect(event.properties[:state_expires_at]).to eq Time.parse('2018-08-18 15:48:00 -0400')
    end
  end
end
