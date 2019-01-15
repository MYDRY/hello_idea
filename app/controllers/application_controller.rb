# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector
  include UsersHelper

  def authorize
    unless logged_in?
      flash[:info] = 'ログインしてください'
      redirect_to root_path
    end
  end
end
