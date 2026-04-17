class WishlistsController < ApplicationController 
  before_action :authenticate_user! 

  def create
    @product = Product.find(params[:product_id])
    current_user.wishlists.create(product: @product)
    
    respond_to do |format|
      format.turbo_stream 
      format.html { redirect_to products_path }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    wishlist_item = current_user.wishlists.find_by(product_id: @product.id)
    wishlist_item.destroy if wishlist_item
    
    respond_to do |format|
      format.turbo_stream 
      format.html { redirect_to products_path }
    end
  end
end
