module AddressParser
  def self.parse!(address)
    region = parse_region(address[:country], address[:region])
    raise Errors::ApplicationError, 'Could not identify shipping region' if region.nil?
    address[:region] = region
    address
  end

  def self.parse_region(country, region)
    country = Carmen::Country.coded(country)
    return region unless country&.code == 'US' || country&.code == 'CA'
    parsed_region = country.subregions.named(region) || country.subregions.coded(region)
    parsed_region&.code
  end
end
