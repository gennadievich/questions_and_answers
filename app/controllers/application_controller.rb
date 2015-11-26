class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  
  helper_method :login, :logout, :current_user

  def login(user)
    session[:user_id] = user[:id]
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
  def authenticate_user!
    unless user_signed_in?
      redirect_to login_path
    end
  end
  
  def user_signed_in?
    !current_user.nil?
  end
end
