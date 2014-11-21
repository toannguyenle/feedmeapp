class AddRestaurantToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :restaurant_id, :integer
    add_index 'products', ['restaurant_id'], :name => 'index_restaurant_id'
  end

  def self.down
    remove_column :products, :restaurant_id
  end
end
