class AddProductToRestaurant < ActiveRecord::Migration
  def change
    add_reference :restaurants, :product, index: true
  end
end
