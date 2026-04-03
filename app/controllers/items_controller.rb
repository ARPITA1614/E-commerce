class ItemsController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @item = @cart.items.find_or_initialize_by(product: product)
    
    if @item.new_record?
      @item.quantity = 1
      @item.price = product.price 
    # else
    #   byebug
    #   @item.quantity += 1
    end

    if @item.save
      redirect_to carts_path, notice: "#{product.name} added to cart."
    else
      redirect_to products_path, alert: "Failed to add item."
    end
  end

  def update
    @item = @cart.items.find(params[:id])
    case params[:operation]
    when 'add'
      @item.increment!(:quantity)
    when 'subtract'
      if @item.quantity == 1
        @item.destroy!
      end
      @item.decrement!(:quantity) if @item.quantity > 1
    end
    redirect_to carts_path
  end

  def destroy
    @item = @cart.items.find(params[:id])
    @item.destroy
    redirect_to carts_path, notice: "Item removed."
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
