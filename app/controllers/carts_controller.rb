class CartsController < ApplicationController
  def show
    @cart = current_user.cart || current_user.create_cart
    @items = @cart.items.includes(:product)
  end
end
