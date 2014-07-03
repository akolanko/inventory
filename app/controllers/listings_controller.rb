class ListingsController < ApplicationController
  
  def all
    @listings = Listing.page(params[:page]).per(10)
  end

  def search
    @listings = Listing.where(website: params[:query]).page(params[:page]).per(10)
  end

  def new
  	@listing = Listing.new
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
  end

  def create
  	@category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @listing = Listing.new(listing_params)
    @listing.product_id = @product.id
    if @listing.save
      flash[:notice] = "Listing created sucessfully."
      redirect_to category_product_path(@category.id, @product.id)
    else
      flash[:alert] = "There were some problems saving your listing."
      render "new"
    end
  end

  def edit
  	@listing = Listing.find(params[:id])
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
  end

  def update
  	@category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @listing = Listing.where(id: params[:id]).first
    if @listing.update_attributes(listing_params)
      flash[:notice] = "Listing updated sucessfully."
      redirect_to category_product_path(@category.id, @product.id)
    else
      flash[:alert] = "There was a problem updating the information."
      redirect_to :back
    end
  end

  def destroy
  	@listing = Listing.where(id: params[:id]).first
    if @listing && @listing.destroy
      flash[:notice] = "Listing deleted sucessfully."
      redirect_to category_product_path(@listing.product.category.id, @listing.product.id)
    else
      flash[:alert] = "There was a problem deleting this listing."
      redirect_to :back
    end
  end

private
	def listing_params
		params.require(:listing).permit(:website, :posted_date)
	end
end
