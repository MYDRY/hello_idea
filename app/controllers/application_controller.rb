class ApplicationController < ActionController::Base
  include UsersHelper
  
  def authorize
    redirect_to login_path unless logged_in?
  end
  
 end
