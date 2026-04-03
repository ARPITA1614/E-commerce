# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Admin Dashboard"
    action_item :add do
    link_to "Create new Product", new_admin_product_path
  end
  content title: proc { "All Users" } do
        panel "Users List" do
          table_for User.all do
            column :id
            column :email
            column :role
            column :created_at
            column "Actions" do |user|
              link_to "View", admin_user_path(user)
              button_to "Delete", soft_delete_admin_user_path(user), method: :put, data: { confirm: "Are you Sure to want to delete the user ?" }
            end
            column :active
            column :description
          end
        end
  end
end
