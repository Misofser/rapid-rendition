class SessionsController < ApplicationController

  def new 
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        flash.now[:danger] = 'Invalid password'
        render :new
      end
    else
      flash.now[:danger] = 'User not found for the given email'
      render :new
    end
  end 

  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end

end
