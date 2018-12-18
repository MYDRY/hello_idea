# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    @user = User.new
  end

  def detail; end

  def tools; end
end
