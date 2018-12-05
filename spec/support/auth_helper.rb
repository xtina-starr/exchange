def jwt_headers(user_id: nil, seller_ids: [], roles: '')
  payload_data = { sub: user_id, partner_ids: seller_ids, roles: roles }
  token = JWT.encode(
    payload_data,
    Rails.application.config_for(:jwt)['hmac_secret'],
    Rails.application.config_for(:jwt)['alg']
  )
  { 'Authorization' => "Bearer: #{token}" }
end
