# typed: true
module UnitConverter
  def self.convert_cents_to_dollars(cents)
    cents.to_f / 100
  end

  def self.convert_dollars_to_cents(dollars)
    (dollars * 100).round
  end
end
