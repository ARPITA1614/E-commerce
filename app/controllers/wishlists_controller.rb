# class WishlistsController < ApplicationController

#     def index
#         @wishlists=Wishlist.all
#     end

#     def new
#         @wishlist=Wishlist.new
#     end

#     def create
#         @wishlist=Wishlist.create(wishlist_params)
#         if @wishlist.save
#             redirect_to wishlist_path, notice: "Wishlist is updated"
#         else
#             redirect_to products_path, notice: "Not"
#         end
#     end

#      private
#   def wishlist_params
#     params.require(:wishlist).permit(:name, :price, :description, :image, :category_id)
#   end

# end
# app/controllers/wishlists_controller.rb
class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlist_items = current_user.wishlist_products
  end

  def create
    @product = Product.find(params[:product_id])
    current_user.wishlist_products << @product unless current_user.wishlist_products.include?(@product)
    redirect_back fallback_location: products_path, notice: "Added to wishlist"
  end

  def destroy
    @wishlist = current_user.wishlists.find_by(product_id: params[:id])
    @wishlist&.destroy
    redirect_back fallback_location: wishlists_path, notice: "Removed from wishlist"
  end
end
