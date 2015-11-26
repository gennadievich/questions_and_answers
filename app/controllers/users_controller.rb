class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :check_if_admin, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.order("created_at desc")
  end
  
  def show
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_url
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
