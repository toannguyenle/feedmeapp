class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :product_count
      t.string :payment_type
      t.integer :processing_time
      t.float :amount
      t.string :status
      t.string :delivery_option
      t.string :delivered_by
      t.string :additional_info
      
      t.timestamps
    end
  end
end
