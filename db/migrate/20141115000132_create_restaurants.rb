class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :website
      t.string :phone_number
      t.string :address
      t.string :yelp_id
      t.string :image_url
      t.string :categories
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
