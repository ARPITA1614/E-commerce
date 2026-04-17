class ProductsController < ApplicationController
    #include Pagy::Backend
  before_action :set_product, only: %i[ update destroy edit show ]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def create
    @product=Product.create(product_params)
    authorize @product
    if @product.save
      redirect_to products_path, notice: "Post created successfully"
    else
      render :new  
    end 
  end

  def new
    @product=Product.new
  end

  def update
    authorize @product
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product updated successfully"
    else
      redirect_to product_path(@product), notice: "Error while updating product"
    end
  end

  def destroy
    authorize @product
    @post.destroy!
    redirect_to products_path
  end

  def edit
  end

  def show
  end

  def set_product
    @product=Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :category_id)
  end
end