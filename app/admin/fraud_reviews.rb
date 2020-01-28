ActiveAdmin.register FraudReview do
  belongs_to :order
  permit_params :order_id, :admin_id, :considered_fraudulent, :reason, :context

  form do |f|
    f.inputs do
      f.input :order_id, as: :string, input_html: {readonly: true, value: order.id}
      f.input :admin_id, input_html: {readonly: true, value: current_user[:id]}, wrapper_html: { style: "display:none" }
      f.input :context
      f.input :considered_fraudulent
      f.input :reason
    end
    f.actions
  end
end
