module ArtworkService
  def self.find(artwork_id)
    Adapters::GravityV1.request("/artworks/#{artwork_id}")
  end
end
