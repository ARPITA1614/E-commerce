class AddNewColToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :active, :boolean, default: true
    add_column :users, :description, :text
  end
end