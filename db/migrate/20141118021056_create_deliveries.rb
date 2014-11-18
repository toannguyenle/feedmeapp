class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :delivery_method
      t.string :delivered_by
      t.string :estimated_delivery_time

      t.timestamps
    end
  end
end
