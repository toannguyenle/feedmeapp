class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :payment_method
      t.string :amount
      t.string :status

      t.timestamps
    end
  end
end
