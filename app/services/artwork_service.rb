module ArtworkService
  PRIVATE_ARTWORK_FIELDS = %i[price_changed_by flags inventory publish_change_requested_by location deleted_by gene_count partner_gene_count dates external_id display_price_range confidential_notes created_at inventory_id published_changed_at publish_change_requested_at secondary_market deleted dimensions_string].freeze

  def self.find(artwork_id)
    Adapters::GravityV1.request("/artwork/#{artwork_id}?include_deleted=true")
  end

  def self.snapshot(artwork_id)
    item = find(artwork_id)
    if item[:images]
      image = item[:images].detect { |img| img[:id] == item[:default_image_id] }
      image ||= item[:images].first
      image_urls = image.try(:fetch, :image_urls)
    else
      image_urls = {}
    end
    permalink = "https://www.artsy.net/artwork/#{item['id']}"
    properties = item.except(*PRIVATE_ARTWORK_FIELDS)
    {
      permalink: permalink,
      title: item[:title],
      image_urls: image_urls,
      properties: properties
    }
  end
end
