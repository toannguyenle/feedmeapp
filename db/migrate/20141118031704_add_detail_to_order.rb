class AddDetailToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :detail, index: true
  end
end
