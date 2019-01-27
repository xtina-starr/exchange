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
                },
                previous {
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
        expect(results.data.orders.total_count).to eq 0
      end

      it 'has no pagination cursors' do
        expect(results.data.orders.page_cursors).to be_nil
      end
    end

    context 'with 1 order' do
      before do
        Fabricate(:order, seller_id: seller_id)
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 1 page for 1 order' do
        expect(results.data.orders.total_pages).to eq 1
        expect(results.data.orders.total_count).to eq 1
      end

      it 'has no pagination cursors' do
        expect(results.data.orders.page_cursors).to be_nil
      end
    end

    context 'with 20 orders and 10 orders per page' do
      before do
        20.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 2 pages for 20 total orders' do
        expect(results.data.orders.total_pages).to eq 2
        expect(results.data.orders.total_count).to eq 20
      end

      it 'has 2 around pages' do
        expect(results.data.orders.page_cursors.first).to be_nil
        expect(results.data.orders.page_cursors.last).to be_nil
        expect(results.data.orders.page_cursors.previous).to be_nil
        expect(results.data.orders.page_cursors.around.count).to eq 2
        expect(results.data.orders.page_cursors.around[0].is_current).to be true
        expect(results.data.orders.page_cursors.around[0].cursor).to_not eq results.data.orders.page_cursors.around[1].cursor
        expect(results.data.orders.page_cursors.around[0].page).to eq 1
        expect(results.data.orders.page_cursors.around[1].is_current).to be false
        expect(results.data.orders.page_cursors.around[1].page).to eq 2
      end
    end

    context 'with 50 orders and 10 orders per page' do
      before do
        50.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 5 around pages' do
        expect(results.data.orders.page_cursors.around.count).to eq 5
        expect(results.data.orders.page_cursors.around.first.is_current).to be true
        expect(results.data.orders.page_cursors.around.first.page).to eq 1
        expect(results.data.orders.page_cursors.around.last.is_current).to be false
        expect(results.data.orders.page_cursors.around.last.page).to eq 5
      end
    end

    context 'with 60 orders and 10 orders per page' do
      before do
        60.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:results) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 4 around pages and a last page' do
        expect(results.data.orders.page_cursors.first).to be_nil
        expect(results.data.orders.page_cursors.last.page).to eq 6
        expect(results.data.orders.page_cursors.previous).to be_nil
        expect(results.data.orders.page_cursors.around.count).to eq 4
        expect(results.data.orders.page_cursors.around.first.is_current).to be true
        expect(results.data.orders.page_cursors.around.first.page).to eq 1
        expect(results.data.orders.page_cursors.around.last.is_current).to be false
        expect(results.data.orders.page_cursors.around.last.page).to eq 4
      end
    end

    context 'with 100 orders and 10 orders per page' do
      before do
        100.times.each { |i| Fabricate(:order, seller_id: seller_id, created_at: i.days.ago) }
      end

      let(:page_one) { client.execute(query, sellerId: seller_id, first: 10) }

      it 'has 4 around pages and a last page on page 1' do
        expect(page_one.data.orders.page_cursors.first).to be_nil
        expect(page_one.data.orders.page_cursors.last.page).to eq 10
        expect(page_one.data.orders.page_cursors.previous).to be_nil
        expect(page_one.data.orders.page_cursors.around.count).to eq 4
        expect(page_one.data.orders.page_cursors.around.first.is_current).to be true
        expect(page_one.data.orders.page_cursors.around.first.page).to eq 1
        expect(page_one.data.orders.page_cursors.around.last.is_current).to be false
        expect(page_one.data.orders.page_cursors.around.last.page).to eq 4
      end

      it 'has 4 around pages and a last page on page 3' do
        page_three_cursor = page_one.data.orders.page_cursors.around.select { |c| c.page == 3 }.first.cursor
        page_three = client.execute(query, sellerId: seller_id, first: 10, after: page_three_cursor)
        expect(page_three.data.orders.page_cursors.first).to be_nil
        expect(page_three.data.orders.page_cursors.last.page).to eq 10
        expect(page_three.data.orders.page_cursors.previous.page).to eq 2
        expect(page_three.data.orders.page_cursors.around.count).to eq 4
        expect(page_three.data.orders.page_cursors.around.first.is_current).to be false
        expect(page_three.data.orders.page_cursors.around.first.page).to eq 1
        expect(page_three.data.orders.page_cursors.around.last.is_current).to be false
        expect(page_three.data.orders.page_cursors.around.last.page).to eq 4
      end

      it 'has 3 around pages and both first and last page on page 4' do
        page_four_cursor = page_one.data.orders.page_cursors.around.select { |c| c.page == 4 }.first.cursor
        page_four = client.execute(query, sellerId: seller_id, first: 10, after: page_four_cursor)
        expect(page_four.data.orders.page_cursors.first.page).to eq 1
        expect(page_four.data.orders.page_cursors.last.page).to eq 10
        expect(page_four.data.orders.page_cursors.previous.page).to eq 3
        expect(page_four.data.orders.page_cursors.around.count).to eq 3
        expect(page_four.data.orders.page_cursors.around.first.is_current).to be false
        expect(page_four.data.orders.page_cursors.around.first.page).to eq 3
        expect(page_four.data.orders.page_cursors.around[1].is_current).to be true
        expect(page_four.data.orders.page_cursors.around[1].page).to eq 4
        expect(page_four.data.orders.page_cursors.around.last.is_current).to be false
        expect(page_four.data.orders.page_cursors.around.last.page).to eq 5
      end
    end
  end
end
