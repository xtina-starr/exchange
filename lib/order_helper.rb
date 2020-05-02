module OrderHelper
  def valid_artwork_version?
    line_items.all?(&:latest_artwork_version?)
  end

  def assert_credit_card
    case credit_card
    when ->(cc) { cc[:external_id].blank? } then :credit_card_missing_external_id
    when ->(cc) { cc.dig(:customer_account, :external_id).blank? } then :credit_card_missing_customer
    when ->(cc) { cc[:deactivated_at].present? } then :credit_card_deactivated
    end
  end

  def artworks
    @artworks ||= line_items.map(&:artwork)
  end

  def artwork
    @artwork ||= begin
      # This is with assumption of Offer order only having one line_item. Follows
      # similar pattern as in offer_totals.
      line_items.first&.artwork
    end
  end

  def artists
    @artists ||= artworks.map { |a| a[:artist] }
  end

  def credit_card
    @credit_card ||= Gravity.get_credit_card(credit_card_id)
  end

  def partner
    @partner ||= Gravity.fetch_partner(seller_id)
  end

  def merchant_account
    @merchant_account ||= Gravity.get_merchant_account(seller_id)
  end

  def seller_locations
    consignment = artwork[:import_source] == 'convection'
    artwork_address = Address.new(artwork[:location])

    # If the artwork originated from a consignment, the seller location
    # corresponds to the artwork location for tax purposes.
    @seller_locations ||= if consignment
      [artwork_address]
    else
      Gravity.fetch_partner_locations(seller_id, tax_only: true)
    end
  end

  def inventory?
    line_items.all?(&:inventory?)
  end

  def artsy_collects_sales_tax?
    @artsy_collects_sales_tax ||= partner[:artsy_collects_sales_tax]
  end

  def current_commission_rate
    @current_commission_rate ||= begin
      current_rate = partner[:effective_commission_rate]
      raise Errors::ValidationError, :missing_commission_rate if current_rate.blank?

      current_rate
    end
  end
end
