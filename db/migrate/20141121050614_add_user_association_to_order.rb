class AddUserAssociationToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :user_id, :integer
    add_index 'orders', ['user_id'], :name => 'index_order_user_id'
  end

  def self.down
    remove_column :orders, :user_id
  end
end