# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector
  include UsersHelper

  def authorize
    redirect_to login_path unless logged_in?
  end
end
