class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
