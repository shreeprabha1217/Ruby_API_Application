class RemoveOrderIdFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :order_id, :integer
  end
end
