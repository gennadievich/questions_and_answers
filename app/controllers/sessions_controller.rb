class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    
  end
  
  def create
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path, flash: {success: "Welcome back :)"}
    else
      render :index 
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
