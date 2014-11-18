class AddOrderToRestaurant < ActiveRecord::Migration
  def change
    add_reference :restaurants, :order, index: true
  end
end
