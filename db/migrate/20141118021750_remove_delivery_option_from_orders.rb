class RemoveDeliveryOptionFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :delivery_option, :string
  end
end
