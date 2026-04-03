ActiveAdmin.register Product do
  # permit_params do
  #   permitted = [:name, :price, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :description, :price, :category_id, :image 
  # action_item :add_new, only: :index do
  #   link_to "Add new Product", new_admin_product_path
  # end
    form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :category_id, as: :select, collection: Categorie.all
      # Adding this one specific line ensures the upload field appears
      f.input :image, as: :file 
    end
    f.actions
  end
  config.filters = false 
end
