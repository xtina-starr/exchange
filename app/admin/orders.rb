ActiveAdmin.register Order do
  actions :all, except: %i[create update destroy new edit]
  config.sort_order = 'state_updated_at_desc'

  scope('Active Orders', default: true) { |scope| scope.active }
  scope('Pickup Orders') { |scope| scope.where(state: [ Order::APPROVED, Order::FULFILLED, Order::SUBMITTED ], fulfillment_type: Order::PICKUP ) }
  scope('Fulfillment Overdue') { |scope| scope.approved.where('state_expires_at < ?', Time.now) }
  scope('Pending & Abandoned Orders') { |scope| scope.where(state: [ Order::ABANDONED, Order::PENDING ]) }

  filter :id_eq, label: 'Order Id'
  filter :seller_id_eq, label: 'Seller Id'
  filter :buyer_id_eq, label: 'Buyer Id'
  filter :created_at, as: :date_range, label: 'Submitted Date'
  filter :fulfillment_type, as: :check_boxes, collection: proc { Order::FULFILLMENT_TYPES }
  filter :state, as: :check_boxes, collection: proc { Order::STATES }

  index do
    column :id
    column :state
    column :fulfillment_type
    # last admin-action
    column 'Submitted At', :created_at
    column 'Last Updated At', :updated_at
    column 'Approval Countdown', (:order) do |order|
      if order.state == Order::SUBMITTED
        format_time order.state_expires_at
      end
    end
    column 'Fulfillment Countdown', (:order) do |order|
      if order.state == Order::APPROVED
        format_time order.state_expires_at
      end
    end
    column 'Total', (:order) do |order|
       number_to_currency order.items_total_cents
    end
  end

end

