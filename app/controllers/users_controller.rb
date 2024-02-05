class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show, :edit, :update, :destroy]
  before_action :check_user_access, only: [:show, :edit, :update, :destroy]

  def show
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
      render turbo_stream: turbo_stream.update("user-form", partial: "form", locals: { user: @user })
    end 
  end

  def edit
  end
  
  def update
    if params[:user][:current_password].present? && !@user.authenticate(params[:user][:current_password])
      @user.errors.add(:current_password, "is incorrect")
      render turbo_stream: turbo_stream.update("user-form", partial: "form", locals: { user: @user })
    elsif @user.update(user_params)
      flash[:notice] = "Profile updated successfully"
      redirect_to @user
    else
      render turbo_stream: turbo_stream.update("user-form", partial: "form", locals: { user: @user })
    end
  end
  
  def destroy
    if @user.destroy
      flash[:notice] = "Your account has been deleted."
      redirect_to root_path
    else
      flash[:alert] = "Failed to delete your account."
      redirect_to root_path
    end
  end
  
  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end 

  def check_user_access
    redirect_to root_path, alert: "Access denied" unless params[:id].to_i == current_user&.id
  end  

end
