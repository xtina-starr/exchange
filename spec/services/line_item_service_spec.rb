require 'rails_helper'
require 'support/gravity_helper'

describe LineItemService, type: :services do
  include ActiveJob::TestHelper
  let(:order) { Fabricate(:order) }
  describe '#create!' do
    let(:line_item_params) { { artwork_id: 'test-id', edition_set_id: 'ed-1', price_cents: 420_00 } }
    it 'queues a job to set line item artwork snapshot' do
      expect do
        LineItemService.create!(order, line_item_params)
      end.to have_enqueued_job(SetLineItemArtworkJob)
    end
    it 'creates new line item and sets artwork snapshot' do
      perform_enqueued_jobs do
        expect(Adapters::GravityV1).to receive(:request).with('/artwork/test-id?include_deleted=true').and_return(gravity_v1_artwork)
        li = LineItemService.create!(order, line_item_params)
        expect(li.reload.artwork_id).to eq 'test-id'
        expect(li.edition_set_id).to eq 'ed-1'
        expect(li.price_cents).to eq 420_00
        artwork_snapshot = li.artwork_snapshot.with_indifferent_access
        expect(artwork_snapshot[:title]).to eq 'Cat'
        expect(artwork_snapshot[:images].first[:image_urls][:cats]).to eq '/path/to/cats.jpg'
      end
    end
  end
  describe '#set_artwork_snapshot' do
    let(:line_item) { Fabricate(:line_item, artwork_id: 'test-id', edition_set_id: 'ed-1') }
    it 'fetches the artwork and constructs the appropriate hash of snapshotted attributes' do
      expect(Adapters::GravityV1).to receive(:request).with('/artwork/test-id?include_deleted=true').and_return(gravity_v1_artwork)
      LineItemService.set_artwork_snapshot(line_item)
      artwork_snapshot = line_item.reload.artwork_snapshot.with_indifferent_access
      expect(artwork_snapshot[:title]).to eq 'Cat'
      expect(artwork_snapshot[:images].first[:image_urls][:cats]).to eq '/path/to/cats.jpg'
      scrubbed_artwork = gravity_v1_artwork
      scrubbed_artwork.delete('confidential_notes')
      expect(artwork_snapshot).to eq scrubbed_artwork
    end
  end
end
