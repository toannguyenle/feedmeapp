class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :categories
      t.string :description
      t.string :image_urls
      t.float :regular_price
      t.float :discount_price
      t.time :discount_start_time
      t.time :discount_end_time
      t.integer :discount_inventory
      t.string :ordr
      t.string :delivery_method

      t.timestamps
    end
  end
end
