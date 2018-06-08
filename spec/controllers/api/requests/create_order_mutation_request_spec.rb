require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'create_order mutation' do
    include_context 'GraphQL Client'
    let(:user_id) { 'user-id' }
    let(:partner_id) { 'partner-id' }
    let(:artwork_id) { 'artwork-1' }
    let(:edition_set_id) { 'ed-1'}
    let(:line_item1) { { artwork_id: artwork_id, edition_set_id: edition_set_id, price_cents: 420_00 } }
    let(:line_items) { [line_item1] }
    let(:order_params_with_line_item) {
      {
        order: {
          user_id: user_id,
          partner_id: partner_id,
          line_items: line_items
        }
      }
    }
    let(:query_with_random_user) {
      <<~GRAPHQL
        mutation {
          createOrder(input: { userId: "123", partnerId: "321", lineItems: [{artworkId: "321", editionSetId: "432", priceCents: 1231 }] }) {
            order {
              id
              userId
              partnerId
            }
            errors
          }
        }
      GRAPHQL
    }
    it 'returns error when users dont match' do
      expect do
        response = client.query(query_with_random_user)
        expect(response.data.create_order.errors.first).to eq 'Not Permitted.'
      end.to change(Order, :count).by(0)
    end
  end
end
