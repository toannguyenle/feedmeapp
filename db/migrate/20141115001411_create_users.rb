class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :phone_number
      t.string :lat
      t.string :lng
      t.integer :type

      t.timestamps
    end
  end
end
