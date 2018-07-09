class UsersController < ApplicationController
  before_action :authorize, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
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
    if @user.save
      log_in @user
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to @user
    else
      render new_user_path
    end
  end

  def login
    @user = User.new
  end

  def check_user
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:password])
      log_in @user
      flash[:notice] = "SUCCESS"
      redirect_to @user
    else
      flash[:notice] = "ERROR"
      @email = params[:user][:email]
      @password = params[:user][:password]
      render "users/login"
    end
  end

  def logout
    log_out
    redirect_to root_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to login_path unless @user == current_user
  end
end
