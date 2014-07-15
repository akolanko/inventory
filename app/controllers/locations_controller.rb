class LocationsController < ApplicationController

  def all
    @locations = Location.page(params[:page]).per(10)
  end

  def search
    @locations = Location.where(location: params[:query].to_s.downcase).page(params[:page]).per(10)
  end

  def new
    @location = Location.new
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @location = Location.new(location_params)
    @location.update_attributes(location: @location.location.downcase)
    @location.product_id = @product.id
    if @location.save
      flash[:notice] = "Location created sucessfully."
      redirect_to category_product_path(@category.id, @product.id)
    else
      flash[:alert] = "There were some problems saving your location."
      render "new"
    end
  end

  def edit
    @location = Location.find(params[:id])
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
  end

  def update
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @location = Location.where(id: params[:id]).first
    @location.update_attributes(location_params)
    @location.update_attributes(location: @location.location.downcase)
    if @location.save
      flash[:notice] = "Location updated sucessfully."
      redirect_to category_product_path(@category.id, @product.id)
    else
      flash[:alert] = "There was a problem updating the information."
      redirect_to :back
    end
  end

  def destroy
    @location = Location.where(id: params[:id]).first
    if @location && @location.destroy
      flash[:notice] = "Location deleted sucessfully."
      redirect_to category_product_path(@location.product.category.id, @location.product.id)
    else
      flash[:alert] = "There was a problem deleting this location."
      redirect_to :back
    end
  end

private
  def location_params
    params.require(:location).permit(:online, :location, :return_date, :contact_name, :contact_email, :contact_phone)
  end

end
