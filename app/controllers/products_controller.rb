class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def instock
    @products = Product.all
  end

  def soldout
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def new
    @product = Product.new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save
      flash[:notice] = "#{@product.name} created successfully."
      redirect_to category_product_path(@product.category.id, @product.id)
    else
      flash[:alert] = "There were some problems saving your product."
      render "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def update
    @category = Category.find(params[:category_id])
    @product = Product.where(id: params[:id]).first
    if @product.update_attributes(product_params)
      flash[:notice] = "Product updated sucessfully."
      redirect_to category_product_path(@category.id, @product.id)
    else
      flash[:alert] = "There was a problem updating the information."
      redirect_to :back
    end
  end

  def destroy
    @product = Product.where(id: params[:id]).first
    if @product && @product.destroy
      flash[:notice] = "Product deleted sucessfully."
      redirect_to category_path(@product.category.id)
    else
      flash[:alert] = "There was a problem deleting this product."
      redirect_to :back
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :color, :material, :measurements, :price, :inventory, :soldout, :image)
  end

end
