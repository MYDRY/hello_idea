# coding: utf-8
class UsersController < ApplicationController
  before_action :authorize, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

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
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to @user
    else
      render new_user_path
    end
  end

  def login
    @user = User.new
  end

  def check_user
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      log_in @user
      flash[:success] = "ログインしました"
      redirect_to @user
    else
      flash[:danger] = "ユーザー名またはパスワードが間違っています"
      redirect_to login_path
    end
  end

  def logout
    log_out
    flash[:success] = "ログアウトしました"
    redirect_to root_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "更新しました"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_path

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :password)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:danger] = "権限がありません"
      redirect_back fallback_location: users_path
    end
  end

  def admin_user
    redirect _to root_path unless current_user.admin?
  end

end
