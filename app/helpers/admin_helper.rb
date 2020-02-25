module AdminHelper
  def convert_currency_code_to_symbol(currency_code)
    '$' if currency_code == 'USD'
    '£' if currency_code == 'GBP'
    '€' if currency_code == 'EUR'
  end

  def format_money_cents(amount_cents, currency_code: 'USD', negate: false)
    return 'N/A' if amount_cents.blank?

    amount_cents *= -1 if negate
    number_to_currency(amount_cents.to_f / 100, unit: convert_currency_code_to_symbol(currency_code), negative_format: '( %u%n )')
  end
end
