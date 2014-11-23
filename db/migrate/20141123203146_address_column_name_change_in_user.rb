class AddressColumnNameChangeInUser < ActiveRecord::Migration
  def change
    add_column :users, :street_address_1, :string
    add_column :users, :street_address_2, :string
  end
end
