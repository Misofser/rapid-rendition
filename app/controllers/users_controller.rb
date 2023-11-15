class UsersController < ApplicationController
  before_action :require_user, only: [:show, :destroy]
  before_action :current_user, only: [:show, :destroy]

  def show
    @user = User.find(params[:id])
    @sketch_count = @user.sketches.count
  end

  def new
    @user = User.new
  end
    
  def create 
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to '/' 
    else 
      redirect_to '/signup' 
    end 
  end

  def destroy
    @user = User.find(params[:id])
    
    if @user.destroy
      flash[:notice] = "Your account has been deleted."
      redirect_to root_path
    else
      flash[:alert] = "Failed to delete your account."
      redirect_to root_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end 

end
