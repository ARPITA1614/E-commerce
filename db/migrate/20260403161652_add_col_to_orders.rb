class AddColToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :total_price, :decimal
    add_column :orders, :status, :string
  end
end
