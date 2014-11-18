class AddOrderToDetail < ActiveRecord::Migration
  def change
    add_reference :details, :order, index: true
  end
end
