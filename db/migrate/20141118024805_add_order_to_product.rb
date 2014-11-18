class AddOrderToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :order, index: true
  end
end
