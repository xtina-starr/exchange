module ArtworkService
  PRIVATE_ARTWORK_FIELDS = %i[price_changed_by flags inventory publish_change_requested_by location deleted_by gene_count partner_gene_count dates external_id display_price_range confidential_notes created_at inventory_id published_changed_at publish_change_requested_at secondary_market deleted dimensions_string].freeze
  ARTWORK_CACHE_EXPIRATION_IN_MINUTES = 10
  def self.find(artwork_id)
    find!(artwork_id)
  rescue Adapters::GravityError
    nil
  end

  def self.find!(artwork_id)
    Rails.cache.fetch("gravity_#{artwork_id}", expires_in: ARTWORK_CACHE_EXPIRATION_IN_MINUTES.minutes) do
      Adapters::GravityV1.request("/artwork/#{artwork_id}?include_deleted=true")
    end
  end

  def self.snapshot(artwork_id)
    item = find(artwork_id)
    item.except(*PRIVATE_ARTWORK_FIELDS)
  end
end
