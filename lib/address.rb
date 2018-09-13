class Address
  attr_reader :country, :region, :city, :street_line1, :street_line2, :postal_code

  def initialize(address)
    @address = parse(address)
    validate! if address.present?
    @country = @address[:country]
    @region = @address[:region]
    @city = @address[:city]
    @street_line1 = @address[:street_line1]
    @street_line2 = @address[:street_line2]
    @postal_code = @address[:postal_code]
  end

  private

  def parse(address)
    country = Carmen::Country.coded(address[:country])
    region = address[:region] || address[:state]
    region = parse_region(country, region)
    {
      country: country&.code,
      region: region,
      city: address[:city],
      street_line1: address[:address_line1] || address[:address],
      street_line2: address[:address_line2],
      postal_code: address[:postal_code] || address[:zip]
    }
  end

  def parse_region(country, region)
    return region unless country&.code == Carmen::Country.coded('US').code || country&.code == Carmen::Country.coded('CA').code
    parsed_region = country.subregions.named(region) || country.subregions.coded(region)
    parsed_region&.code
  end

  def validate!
    raise Errors::ValidationError, :missing_country if @address[:country].nil?
    validate_us_address! if @address[:country] == Carmen::Country.coded('US').code
    validate_ca_address! if @address[:country] == Carmen::Country.coded('CA').code
  end

  def validate_us_address!
    raise Errors::ValidationError, :missing_region if @address[:region].nil?
    raise Errors::ValidationError, :missing_postal_code if @address[:postal_code].nil?
  end

  def validate_ca_address!
    raise Errors::ValidationError, :missing_region if @address[:region].nil?
  end
end
