class Types::LineItemAttributes < Types::BaseInputObject
  description 'Attributes for a LineItem'

  argument :price_cents, Integer, "Item's price in cents", required: true
  argument :artwork_id, String, 'Artwork Id', required: true
  argument :edition_set_id, String, 'EditionSet Id', required: false
  argument :quantity, Integer, 'Number of items in the line item', required: true
end
