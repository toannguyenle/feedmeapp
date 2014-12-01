class RemoveAdditionalInfoFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :additional_info, :string
  end
end
