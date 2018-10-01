ActiveAdmin.register Order do
  actions :all, except: %i[create update destroy new edit]
  # TODO: change sort order
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
  filter :state_reason, as: :check_boxes, collection: proc { Order::REASONS.values.map(&:values).flatten.uniq.map!(&:humanize) }

  index do
    column :id do |order|
      link_to order.id, admin_order_path(order.id)
    end
    column :state
    column :fulfillment_type
    column :last_admin_note
    column 'Submitted At', :created_at
    column 'Last Updated At', :updated_at
    column :state_expires_at
    column 'Items Total', (:order) do |order|
       number_to_currency order.items_total_cents
    end
    column 'Buyer Total', (:order) do |order|
       number_to_currency order.buyer_total_cents
    end
  end

  show do
    h1 order.to_s

    panel "Order Summary" do
      attributes_table_for order do
        row :state
        row 'Reason', :state_reason
        row 'Last Updated At', :updated_at
        #Last admin action
        #Last note
        #row 'Order Status Link', link_to artsy_order_item_status_url(:id)
      end
      br 
      para "Shipment"
      if order.shipping_info?
        para "Carrier"
      else
        para "None"
      end


    end

    panel "Transaction" do
      attributes_table_for order do
        row :id
        row :state
      end
    end

#   panel "Admin Actions and Notes" do
#   end

  end

  sidebar :contact_info, only: :show do

    panel "Buyer Information" do
    end

    panel "Seller Information" do
    end
  end
  
end




