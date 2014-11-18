class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :status
      t.string :additional_info

      t.timestamps
    end
  end
end
