require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'orders pagination query' do
    include_context 'GraphQL Client'

    let(:seller_id) { jwt_partner_ids.first }

    let(:query) do
      <<-GRAPHQL
          query($sellerId: String, $first: Int, $after: String, $last: Int, $before: String) {
            orders(sellerId: $sellerId, first: $first, after: $after, last: $last, before: $before) {
              edges {
                cursor
                node {
                  id
                }
              }
              pageCursors {
                first {
                  cursor
                  isCurrent
                  page
                },
                last {
                  cursor
                  isCurrent
                  page
                },
                around {
                  cursor
                  isCurrent
                  page
                }
              }
              totalCount
              totalPages
            }
          }
      GRAPHQL
    end

    context 'with 0 orders' do
      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has no pages' do
        expect(results.data.orders.total_pages).to eq 0
      end

      it 'does not have any pagination cursors' do
        expect(results.data.orders.page_cursors).to be_nil
      end
    end

    context 'with 1 order' do
      before do
        Fabricate(:order, seller_id: seller_id)
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 1 total orders' do
        expect(results.data.orders.total_count).to eq 1
      end

      it 'has 1 total pages' do
        expect(results.data.orders.total_pages).to eq 1
      end

      it 'has a first page with a blank cursor' do
        expect(results.data.orders.page_cursors.first.is_current).to be true
        expect(results.data.orders.page_cursors.first.cursor).to be_empty
        expect(results.data.orders.page_cursors.first.page).to eq 1
      end

      it 'has a last page that matches the first page' do
        expect(results.data.orders.page_cursors.last.is_current).to eq results.data.orders.page_cursors.first.is_current
        expect(results.data.orders.page_cursors.last.cursor).to eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.last.page).to eq results.data.orders.page_cursors.first.page
      end

      it 'has 1 around page that matches the first page' do
        expect(results.data.orders.page_cursors.around.count).to eq 1
        expect(results.data.orders.page_cursors.around[0].is_current).to eq results.data.orders.page_cursors.first.is_current
        expect(results.data.orders.page_cursors.around[0].cursor).to eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[0].page).to eq results.data.orders.page_cursors.first.page
      end
    end

    context 'with 20 orders and 10 orders per page' do
      before do
        20.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 20 total orders' do
        expect(results.data.orders.total_count).to eq 20
      end

      it 'has 2 total pages' do
        expect(results.data.orders.total_pages).to eq 2
      end

      it 'has a first page with a blank cursor' do
        expect(results.data.orders.page_cursors.first.is_current).to be true
        expect(results.data.orders.page_cursors.first.cursor).to be_empty
        expect(results.data.orders.page_cursors.first.page).to eq 1
      end

      it 'has a last page that represents the second page' do
        expect(results.data.orders.page_cursors.last.is_current).to be false
        expect(results.data.orders.page_cursors.last.cursor).to_not be_empty
        expect(results.data.orders.page_cursors.last.page).to eq 2
      end

      it 'has 2 around pages that match first and last pages' do
        expect(results.data.orders.page_cursors.around.count).to eq 2
        expect(results.data.orders.page_cursors.around[0].is_current).to eq results.data.orders.page_cursors.first.is_current
        expect(results.data.orders.page_cursors.around[0].cursor).to eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[0].page).to eq results.data.orders.page_cursors.first.page
        expect(results.data.orders.page_cursors.around[1].is_current).to eq results.data.orders.page_cursors.last.is_current
        expect(results.data.orders.page_cursors.around[1].cursor).to eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[1].page).to eq results.data.orders.page_cursors.last.page
      end
    end

    context 'with 30 orders and 10 orders per page' do
      before do
        30.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 3 around pages that include the first and last page' do
        expect(results.data.orders.page_cursors.around.count).to eq 3
        expect(results.data.orders.page_cursors.around[0].is_current).to eq results.data.orders.page_cursors.first.is_current
        expect(results.data.orders.page_cursors.around[0].cursor).to eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[0].page).to eq results.data.orders.page_cursors.first.page
        expect(results.data.orders.page_cursors.around[1].is_current).to be false
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[1].page).to eq 2
        expect(results.data.orders.page_cursors.around[2].is_current).to eq results.data.orders.page_cursors.last.is_current
        expect(results.data.orders.page_cursors.around[2].cursor).to eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[2].page).to eq results.data.orders.page_cursors.last.page
      end
    end

    context 'with 30 orders and 10 orders per page' do
      before do
        30.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 3 around pages that include the first and last page' do
        expect(results.data.orders.page_cursors.around.count).to eq 3
        expect(results.data.orders.page_cursors.around[0].is_current).to eq results.data.orders.page_cursors.first.is_current
        expect(results.data.orders.page_cursors.around[0].cursor).to eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[0].page).to eq results.data.orders.page_cursors.first.page
        expect(results.data.orders.page_cursors.around[1].is_current).to be false
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[1].page).to eq 2
        expect(results.data.orders.page_cursors.around[2].is_current).to eq results.data.orders.page_cursors.last.is_current
        expect(results.data.orders.page_cursors.around[2].cursor).to eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[2].page).to eq results.data.orders.page_cursors.last.page
      end
    end

    context 'with 40 orders and 10 orders per page' do
      before do
        40.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 3 around pages that include the first page but not the last page' do
        expect(results.data.orders.page_cursors.around.count).to eq 3
        expect(results.data.orders.page_cursors.around[0].is_current).to eq results.data.orders.page_cursors.first.is_current
        expect(results.data.orders.page_cursors.around[0].cursor).to eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[0].page).to eq results.data.orders.page_cursors.first.page
        expect(results.data.orders.page_cursors.around[1].is_current).to be false
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.around[2].cursor
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[1].page).to eq 2
        expect(results.data.orders.page_cursors.around[2].is_current).to be false
        expect(results.data.orders.page_cursors.around[2].cursor).to_not eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[2].cursor).to_not eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[2].page).to eq 3
      end
    end

    context 'with 50 orders and 10 orders per page' do
      before do
        50.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }
      
      it 'has 3 around pages that do not include the first or last pages' do
        expect(results.data.orders.page_cursors.around.count).to eq 3
        expect(results.data.orders.page_cursors.around[0].is_current).to be false
        expect(results.data.orders.page_cursors.around[0].cursor).to_not eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[0].cursor).to_not eq results.data.orders.page_cursors.around[1].cursor
        expect(results.data.orders.page_cursors.around[0].cursor).to_not eq results.data.orders.page_cursors.around[2].cursor
        expect(results.data.orders.page_cursors.around[0].cursor).to_not eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[0].page).to eq 2
        expect(results.data.orders.page_cursors.around[1].is_current).to be false
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.around[2].cursor
        expect(results.data.orders.page_cursors.around[1].cursor).to_not eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[1].page).to eq 3
        expect(results.data.orders.page_cursors.around[2].is_current).to be false
        expect(results.data.orders.page_cursors.around[2].cursor).to_not eq results.data.orders.page_cursors.first.cursor
        expect(results.data.orders.page_cursors.around[2].cursor).to_not eq results.data.orders.page_cursors.last.cursor
        expect(results.data.orders.page_cursors.around[2].page).to eq 4
      end
    end
  end
end
