# typed: false
class AddOrderAnalyticsFields < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :original_user_agent, :string
    add_column :orders, :original_user_ip, :string
  end
end
