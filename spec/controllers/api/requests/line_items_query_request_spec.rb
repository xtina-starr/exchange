require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'line_items query' do
    include_context 'GraphQL Client'
    let(:seller_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }

    let(:artwork_id) { 'a-1' }
    let(:edition_set_id) { 'e-1' }
    let(:order) { Fabricate(:order, seller_id: seller_id, buyer_id: user_id) }
    let!(:line_item) { Fabricate(:line_item, order: order, artwork_id: artwork_id, edition_set_id: edition_set_id, quantity: 2) }

    let(:query) do
      <<-GRAPHQL
        query($artworkId: String, $editionSetId: String) {
          lineItems(artworkId: $artworkId, editionSetId: $editionSetId) {
            edges {
              node {
                id
                listPriceCents
                artworkId
                editionSetId
                order {
                  id
                }
              }
            }
          }
        }
      GRAPHQL
    end

    xit 'returns error when missing both artworkId and editionSetId' do
      expect do
        client.execute(query)
      end.to raise_error do |error|
        expect(error).to be_a(Graphlient::Errors::ServerError)
        expect(error.message).to eq 'the server responded with status 400'
        expect(error.status_code).to eq 400
        expect(error.response['errors'].first['extensions']['code']).to eq 'missing_params'
        expect(error.response['errors'].first['extensions']['type']).to eq 'validation'
      end
    end

    xcontext 'giving no query parameters' do
      let(:query) do
        <<-GRAPHQL
          query {
            orders {
              totalCount
            }
          }
        GRAPHQL
      end
      it 'returns missing_params validation error' do
        expect do
          client.execute(query, state: 'PENDING')
        end.to raise_error do |error|
          expect(error).to be_a(Graphlient::Errors::ServerError)
          expect(error.message).to eq 'the server responded with status 400'
          expect(error.status_code).to eq 400
          expect(error.response['errors'].first['extensions']['code']).to eq 'missing_params'
          expect(error.response['errors'].first['extensions']['type']).to eq 'validation'
        end
      end
    end

    context 'query with artworkId' do
      it 'returns line items' do
        result = client.execute(query, artworkId: artwork_id)
        expect(result.data.line_items.edges.count).to eq 1
        expect(result.data.line_items.edges.first.node.artwork_id).to eq artwork_id
        expect(result.data.line_items.edges.first.node.order.id).to eq order.id
      end
    end

    context 'query with editionSetId' do
      it 'returns line items' do
        result = client.execute(query, editionSetId: edition_set_id)
        expect(result.data.line_items.edges.count).to eq 1
        expect(result.data.line_items.edges.first.node.edition_set_id).to eq edition_set_id
        expect(result.data.line_items.edges.first.node.order.id).to eq order.id
      end
    end

    xcontext 'trusted user rules' do
      let(:jwt_user_id) { 'rando' }

      context 'trusted account accessing another account\'s order' do
        let(:jwt_roles) { 'trusted' }
        it 'allows access' do
          expect do
            client.execute(query, buyerId: 'someone-elses-userid')
          end.to_not raise_error
        end
      end

      context 'un-trusted account accessing another account\'s order' do
        let(:jwt_roles) { 'foobar' }
        it 'raises error' do
          expect do
            client.execute(query, buyerId: 'someone-elses-userid')
          end.to raise_error do |error|
            expect(error).to be_a(Graphlient::Errors::ServerError)
            expect(error.status_code).to eq 404
            expect(error.message).to eq 'the server responded with status 404'
            expect(error.response['errors'].first['extensions']['code']).to eq 'not_found'
            expect(error.response['errors'].first['extensions']['type']).to eq 'validation'
          end
        end
      end
    end
  end
end
