# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authorize, only: %i[tools]

  def top
    @user = User.new
  end

  def tools; end
end
