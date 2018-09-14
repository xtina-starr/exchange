ActiveAdmin.register Order do
  actions :all, except: %i[create update destroy new edit]

  scope('Active Orders', default: true) { |scope| scope.where.not(state: [ Order::APPROVED, Order::PENDING ]) }
  scope('Pickup Orders') { |scope| scope.where(state: [ Order::APPROVED, Order::FULFILLED ], fulfillment_type: Order::PICKUP ) }
  scope('Fulfillment Overdue') { |scope| scope.where(state: Order::APPROVED) }
  scope('Pending & Abandoned Orders') { |scope| scope.where(state: [ Order::ABANDONED, Order::PENDING ]) }

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
