class Types::FulfillmentAttributes < Types::BaseInputObject
  description 'Attributes of a Fulfillment'

  argument :courier, String, required: true
  argument :tracking_id, String, required: false
  argument :estimated_delivery, Types::DateType, required: false
  argument :notes, String, required: false
end
