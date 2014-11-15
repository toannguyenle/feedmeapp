class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :product_count
      t.string :delivery_option
      t.integer :processing_time
      t.string :status

      t.timestamps
    end
  end
end
