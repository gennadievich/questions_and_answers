class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:register, :create]
  skip_before_action :check_if_user_active, only: [:register, :create]
  before_action :check_if_admin, except: [:register, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.order("created_at desc")
    @questions = Question.all
  end
  
  def show
  end

  def register
    @user = User.new
  end
  
  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      if current_user
        redirect_to users_path
      else
        login(@user)
        
        redirect_to root_path
      end
    else
      if current_user
        render :new
      else
        redirect_to :back
      end
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    
    redirect_to users_path
  end

  def activate
    user = User.find(params[:id])
    user.update_column(:active, true)
    
    redirect_to :back
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :active, :status)
    end
end
