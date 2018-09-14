ActiveAdmin.register Order do
  actions :all, except: %i[create update destroy new edit]

  scope('Active', default: true) { |scope| scope.active }
  scope('Pending') { |scope| scope.pending }
  scope('Submitted') { |scope| scope.where(state: Order::SUBMITTED) }

  filter :seller_id_eq, label: 'Seller Id'
  filter :buyer_id_eq, label: 'User Id'
  filter :fulfillment_type, as: :check_boxes, collection: proc { Order::FULFILLMENT_TYPES }
  filter :state, as: :check_boxes, collection: proc { Order::STATES }

  index do
    column :id
    column :state
    column :items_total_cents
    column :currency
    column :fulfillment_type
    column :shipping_country
    column :updated_at
  end

end
