class HomeController < ApplicationController
  skip_before_action :check_if_user_active
  
  def index
  end
  
  def permission_denied
  end
end
