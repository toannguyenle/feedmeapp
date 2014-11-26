class RemoveProductCountFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_count, :string
  end
end
