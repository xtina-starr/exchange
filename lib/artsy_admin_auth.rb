class ArtsyAdminAuth
  def self.valid?(token)
    return false unless token
    decoded_token, _headers = JWT.decode(token, Rails.application.config_for(:jwt)['hmac_secret'])
    decoded_token['roles'].include? 'sales_admin'
  end

  def self.get_user_id(token)
    decoded_token, _headers = JWT.decode(token, Rails.application.config_for(:jwt)['hmac_secret'])
    decoded_token['sub']
  end
end
