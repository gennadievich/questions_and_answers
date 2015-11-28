class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, :check_if_user_active
  
  def index
    
  end
  
  def create
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path
    else
      render :index 
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
