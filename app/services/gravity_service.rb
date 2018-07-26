module GravityService
  def self.fetch_partner(partner_id)
    Rails.cache.fetch("gravity_partner_#{partner_id}", expire_in: Rails.application.config_for(:gravity)['partner_cache_in_minutes'].minutes) do
      Adapters::GravityV1.request("/partner/#{partner_id}/all")
    end
  end
end
