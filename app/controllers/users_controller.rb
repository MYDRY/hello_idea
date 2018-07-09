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
      redirect_to root_path
    end
  end

  def logout
    log_out
    redirect_to root_path
  end

  def edit
  end

  def update
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    p file = params[:user][:image]
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb') do |f|
        f.write(file.read)
      end
      @user.image = file_name
    end
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
