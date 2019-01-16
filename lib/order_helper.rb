module OrderHelper
  def valid_artwork_version?
    line_items.all? { |li| artworks[li[:artwork_id]][:current_version_id] == li[:artwork_version_id] }
  end

  def assert_credit_card
    case credit_card
    when ->(cc) { cc[:external_id].blank? } then :credit_card_missing_external_id
    when ->(cc) { cc.dig(:customer_account, :external_id).blank? } then :credit_card_missing_customer
    when ->(cc) { cc[:deactivated_at].present? } then :credit_card_deactivated
    end
  end

  def artworks
    @artworks ||= Hash[line_items.pluck(:artwork_id).uniq.map do |artwork_id|
      artwork = Gravity.get_artwork(artwork_id)
      validate_artwork!(artwork)
      [artwork[:_id], artwork]
    end]
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
    @seller_locations ||= Gravity.fetch_partner_locations(seller_id)
  end

  def inventory?
    line_items.all? do |li|
      artwork = artworks[li.artwork_id]
      inventory = if li.edition_set_id.present?
                    edition_set = artwork[:edition_sets].detect { |a| a[:id] == li.edition_set_id }
                    raise Errors::ValidationError, :unknown_edition_set unless edition_set

                    edition_set[:inventory]
                  else
                    artwork[:inventory]
                  end
      inventory[:count].positive? || inventory[:unlimited] == true
    end
  end

  def artsy_collects_sales_tax?
    @artsy_collects_sales_tax ||= partner[:artsy_collects_sales_tax]
  end

  private

  def validate_artwork!(artwork)
    raise Errors::ValidationError, :unknown_artwork unless artwork
    raise Errors::ValidationError, :missing_artwork_location if artwork[:location].blank?
  end
end
