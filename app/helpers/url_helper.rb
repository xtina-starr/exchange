module UrlHelper
  def artsy_order_status_url(order_id)
    "https://www.artsy.net/order/#{order_id}/status"
  end

  #TODO: make this take an artwork id
  def artsy_view_artwork_url()
    'https://www.artsy.net/'
  end

  def artsy_view_user_admin_url(user_id)
    "https://admin.artsy.net/user/#{user_id}"
  end

  def artsy_view_partner_admin_url(partner_id)
    "https://admin-partners.artsy.net/partners/#{partner_id}"
  end

end
