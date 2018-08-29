ActiveAdmin.register Order do
  actions :all, except: %i[create update destroy new edit]

  scope('Active', default: true) { |scope| scope.active }
  scope('Pending') { |scope| scope.pending }

  filter :seller_id_eq, label: 'Partner Id'
  filter :buyer_id_eq, label: 'User Id'
  filter :fulfillment_type, as: :check_boxes, collection: proc { Order::FULFILLMENT_TYPES }

  index do
    column :id
    column :seller_id
    column :buyer_id
    column :state
    column :items_total_cents
    column :currency
    column :fulfillment_type
    column :shipping_country
    column :updated_at
  end

end
