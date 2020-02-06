class GravityGraphql < Artemis::Client
  class GraphQLError < StandardError; end

  def self.authenticated
    with_context(headers: { 'X-XAPP-TOKEN' => Rails.application.config_for(:gravity)['xapp_token'] })
  end

  after_execute do |_data, errors, _extensions|
    raise GraphQLError, errors.to_json.to_s if errors.present?
  end
end
