module Errors
  ERROR_TYPES = {
    validation: %i[
      credit_card_deactivated
      credit_card_missing_customer
      credit_card_missing_external_id
      credit_card_not_found
      failed_order_code_generation
      invalid_artwork_address
      invalid_commission_rate
      invalid_order
      invalid_seller_address
      invalid_state
      missing_artwork_location
      missing_commission_rate
      missing_country
      missing_currency
      missing_domestic_shipping_fee
      missing_edition_set_id
      missing_international_shipping_fee
      missing_merchant_account
      missing_params
      missing_partner_location
      missing_postal_code
      missing_price
      missing_region
      missing_required_info
      missing_required_param
      no_taxable_addresses
      not_acquireable
      not_found
      unknown_artwork
      unknown_edition_set
      unknown_partner
      unpublished_artwork
      unsupported_shipping_location
      wrong_fulfillment_type
    ],
    processing: %i[
      artwork_version_mismatch
      capture_failed
      charge_authorization_failed
      insufficient_inventory
      refund_failed
      tax_recording_failure
      tax_calculator_failure
      tax_refund_failure
    ],
    internal: %i[
      generic
      gravity
    ]
  }.freeze
end
