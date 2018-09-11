module AddressParser
  def self.parse(address)
    country = Carmen::Country.coded(address[:country])
    region = parse_region(country, address[:region])
    address[:country] = country&.code
    address[:region] = region
    address
  end

  def self.parse_region(country, region)
    return region unless country&.code == 'US' || country&.code == 'CA'
    parsed_region = country.subregions.named(region) || country.subregions.coded(region)
    parsed_region&.code
  end
end
