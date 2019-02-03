# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector
  include UsersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    flash[:danger] = 'そのページは存在しません'
    redirect_to root_path
  end

  def authorize
    unless logged_in?
      flash[:info] = 'ログインしてください'
      redirect_to root_path
    end
  end
end
