ActiveAdmin.register FraudReview do
  actions :all, except: %i[update destroy edit]
  belongs_to :order
  permit_params :order_id, :admin_id, :flagged_as_fraud, :reason, :context

  form do |f|
    f.inputs do
      f.input :order_id, as: :string, input_html: { readonly: true, value: order.id }, wrapper_html: { style: 'display:none' }
      f.input :admin_id, input_html: { readonly: true, value: current_user[:id] }, wrapper_html: { style: 'display:none' }
      f.input :flagged_as_fraud, label: 'Flag as fraud'
      f.input :reason
    end
    f.actions
  end

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_order_path(params[:order_id]) }
      end
    end
  end
end
