# typed: false
class Inputs::ShippingAttributes < Types::BaseInputObject
  description 'Shipping information'

  # shouldn't most of these be required?
  argument :name, String, required: false
  argument :address_line1, String, required: false
  argument :address_line2, String, required: false
  argument :city, String, required: false
  argument :region, String, required: false
  argument :country, String, required: false
  argument :postal_code, String, required: false
  argument :phone_number, String, required: true
end
