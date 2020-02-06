class GravityGraphql < Artemis::Client
  class GraphQLError < StandardError; end

  def self.authenticated
    with_context( headers: {'X-XAPP-TOKEN' => Rails.application.config_for(:gravity)['xapp_token']} )
  end

  after_execute do |data, errors, extensions|
    raise GraphQLError, "#{errors.to_json}" if errors.present?
  end
end
