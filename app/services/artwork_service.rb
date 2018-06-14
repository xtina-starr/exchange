module ArtworkService
  PRIVATE_ARTWORK_FIELDS = %i[price_changed_by flags inventory publish_change_requested_by location deleted_by gene_count partner_gene_count dates external_id display_price_range confidential_notes created_at inventory_id published_changed_at publish_change_requested_at secondary_market deleted dimensions_string].freeze

  def self.find(artwork_id)
    Adapters::GravityV1.request("/artwork/#{artwork_id}?include_deleted=true")
  end

  def self.snapshot(artwork_id)
    item = find(artwork_id)
    item.except(*PRIVATE_ARTWORK_FIELDS)
  end
end
