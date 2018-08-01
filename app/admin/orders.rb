ActiveAdmin.register Order do
  actions :all, except: %i[create update destroy new edit]

  scope('Active', default: true) { |scope| scope.active }
  scope('Pending') { |scope| scope.pending }

  filter :partner_id_eq, label: 'Partner Id'
  filter :user_id_eq, label: 'User Id'
  filter :fulfillment_type, as: :check_boxes, collection: proc { Order::FULFILLMENT_TYPES }

  index do
    column :id
    column :partner_id
    column :user_id
    column :state
    column :fulfillment_type
    column :shipping_country
    column :updated_at
    column 'Messages' do |conversation|
      link_to conversation.messages.size, admin_conversation_messages_path(conversation)
    end
    actions
  end

end
