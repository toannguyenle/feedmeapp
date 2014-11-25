class AddAddressDetailsToRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :address, :street_address_1
    add_column :restaurants, :street_address_2, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :zipcode, :string
    add_column :restaurants, :country, :string
  end
end
