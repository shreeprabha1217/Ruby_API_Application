class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :product_quantity
      t.references :product, foreign_key: true
      t.integer :total

      t.timestamps
    end
  end
end
