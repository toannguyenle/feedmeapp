class AddAdditionalInfoToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :additional_info, :string
  end
end
