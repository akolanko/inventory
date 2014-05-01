class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to root_path, :notice => "Welcome back #{@user.username}"
  	else
  		flash[:alert] = "There was a problem signing you in."
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You have been signed out."
  	redirect_to root_path
  end


end
