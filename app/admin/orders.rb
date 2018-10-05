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

  member_action :refund, method: :post do
    OrderCancellationService.new(resource).refund!
    redirect_to resource_path, notice: "Refunded!"
  end

  action_item :refund, only: :show do
    link_to 'Refund', refund_admin_order_path(order), method: :post if [Order::APPROVED, Order::FULFILLED].include? order.state
  end

  sidebar :contact_info, only: :show do
    #TODO: why doesn't this work?
    link_to "artsy.net" do
      button "View Artwork on Artsy"
    end
    panel "Buyer Information" do
      attributes_table_for order do
        #TODO: fill this in
        row :name
        row :shipping_address do
          if order.shipping_info?
            #TODO: shipping info
            #table_for order.admin_notes
          else
            'None'
          end
        end
        row :shipping_phone
        row :email
      end
    end

    panel "Seller Information" do
      attributes_table_for order do
        #TODO: fill this in
        row :partner_name
        row :address
        row :phone
        row :email
        row :sales_contacts do
          #TODO: add sales contacts
          #table_for
        end
      end
      link_to "artsy.net" do
        button "View Partner in Admin-Partners"
      end
    end
  end

  show do

    panel "Order Summary" do
      attributes_table_for order do
        row :state
        row 'Reason', :state_reason
        row 'Last Updated At', :updated_at
        #Last admin action
        #Last note
        #row 'Order Status Link', link_to artsy_order_item_status_url(:id)
        row 'Shipment' do |order|
          if order.shipping_info?
            #TODO: shipping info
            #table_for order.admin_notes
          else
            'None'
          end
        end
        row 'Admin Notes' do |order|
          #TODO: admin notes
          #table_for order.admin_notes
        end
      end
      br


    end

    panel "Transaction" do
      #TODO: finish this payment summary
      para "Paid #{number_to_currency order.buyer_total_cents}"

      attributes_table_for order do
        row "Artwork Price" do |order|
           number_to_currency order.items_total_cents
        end
        row "Shipping" do |order|
           number_to_currency order.shipping_total_cents
        end
        row "Sales Tax" do |order|
           number_to_currency order.tax_total_cents
        end
        row "Subtotal" do |order|
          number_to_currency(order.items_total_cents.to_i +
                             order.shipping_total_cents.to_i +
                             order.tax_total_cents.to_i)
        end
        row "Processing Fee" do |order|
           number_to_currency order.transaction_fee_cents
        end
        row "Artsy Fee" do |order|
           number_to_currency order.commission_fee_cents
        end
        row "Seller Payout" do |order|
           number_to_currency(order.items_total_cents.to_i + order.shipping_total_cents.to_i + order.tax_total_cents.to_i - order.transaction_fee_cents.to_i - order.commission_fee_cents.to_i)
        end

      end
    end

    panel "Admin Actions and Notes" do
      #TODO: Add "Add note" button
      table_for(order.admin_notes) do
        column :created_at
        column :type
        column :description
      end
    end

  end

end
