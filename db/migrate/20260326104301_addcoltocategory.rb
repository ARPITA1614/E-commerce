class Addcoltocategory < ActiveRecord::Migration[8.1]
  def change
    add_column :Categories, :name, :string
  end
end
