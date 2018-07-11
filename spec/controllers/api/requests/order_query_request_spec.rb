require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'order query' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:second_partner_id) { 'partner-2' }
    let(:user_id) { jwt_user_id }
    let(:second_user) { 'user2' }
    let!(:user1_order1) { Fabricate(:order, partner_id: partner_id, user_id: user_id, updated_at: 1.day.ago, shipping_total_cents: 100_00, commission_fee_cents: 50_00) }
    let!(:user2_order1) { Fabricate(:order, partner_id: second_partner_id, user_id: second_user) }

    let(:query) do
      <<-GRAPHQL
        query($id: ID!) {
          order(id: $id) {
            id
            userId
            partnerId
            state
            currencyCode
            itemsTotalCents
            shippingTotalCents
            totalCents
            subtotalCents
            lineItems{
              edges{
                node{
                  priceCents
                }
              }
            }
          }
        }
      GRAPHQL
    end

    context 'user accessing their order' do
      it 'returns permission error when query for orders by user not in jwt' do
        expect do
          client.execute(query, id: user2_order1.id)
        end.to raise_error(Graphlient::Errors::ExecutionError, 'order: Not permitted')
      end

      it 'returns order when accessing correct order' do
        result = client.execute(query, id: user1_order1.id)
        expect(result.data.order.user_id).to eq user_id
        expect(result.data.order.partner_id).to eq partner_id
        expect(result.data.order.currency_code).to eq 'usd'
        expect(result.data.order.state).to eq 'PENDING'
        expect(result.data.order.items_total_cents).to eq 0
        expect(result.data.order.total_cents).to eq 50_00
        expect(result.data.order.subtotal_cents).to eq 100_00
      end
    end

    context 'partner accessing order' do
      it 'returns order when accessing correct order' do
        another_user_order = Fabricate(:order, partner_id: partner_id, user_id: 'someone-else-id')
        result = client.execute(query, id: another_user_order.id)
        expect(result.data.order.user_id).to eq 'someone-else-id'
        expect(result.data.order.partner_id).to eq partner_id
        expect(result.data.order.currency_code).to eq 'usd'
        expect(result.data.order.state).to eq 'PENDING'
        expect(result.data.order.items_total_cents).to eq 0
      end
    end
  end
end
