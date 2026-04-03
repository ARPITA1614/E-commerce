class AddAttributeToitems < ActiveRecord::Migration[8.1]
  def change
    add_column :items, :quantity, :integer, default: 1
    add_column :items, :price, :decimal, precision: 8, scale: 2
  end
end
