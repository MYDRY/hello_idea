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
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
