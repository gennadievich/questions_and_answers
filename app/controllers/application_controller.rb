class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_if_user_active

  protect_from_forgery with: :exception
  
  helper_method :login, :logout, :current_user, :check_if_admin, :check_if_user_active

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
  
  def user_active?
    current_user.active?
  end
  
  def check_if_user_active
    unless user_active?
      redirect_to wait_for_activation_path
    end
  end
  
  def check_if_admin
    unless current_user.admin?
      redirect_to permission_denied_path
    end
  end
end
