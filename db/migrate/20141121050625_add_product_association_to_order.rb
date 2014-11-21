class AddProductAssociationToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :product_id, :integer
    add_index 'orders', ['product_id'], :name => 'index_product_id'
  end

  def self.down
    remove_column :orders, :product_id
  end
end