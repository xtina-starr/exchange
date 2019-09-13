class ArtsyAuthToken
  TRUSTED_ADMIN_ROLES = %w[partner_support sales_admin].freeze

  def self.trusted_admin?(user_roles)
    (TRUSTED_ADMIN_ROLES & user_roles).any?
  end

  def initialize(jwt)
    @jwt = jwt
    @decoded_token = decode_token
  end

  def admin?
    return false unless @decoded_token

    user_roles = @decoded_token['roles'].split(',')
    self.class.trusted_admin?(user_roles)
  end

  def current_user
    @decoded_token.merge(id: @decoded_token[:sub])
  end

  private

  def decode_token
    JWT.decode(@jwt, Rails.application.config_for(:jwt)['hmac_secret'], true, algorithm: 'HS256')[0].with_indifferent_access
  end
end
