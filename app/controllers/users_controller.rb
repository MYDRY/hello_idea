class UsersController < ApplicationController
  def index
  	@users=User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  def login
    @user = User.new
  end

  def check_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      log_in @user
      flash[:notice] = "SUCCESS"
      redirect_to @user
    else
      flash[:notice] = "ERROR"
      redirect_to root_url
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
