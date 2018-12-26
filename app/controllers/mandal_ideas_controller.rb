# frozen_string_literal: true

class MandalIdeasController < ApplicationController
  def index
    mandal = params[:mandal]
    @ideas = MandalIdea.where(simple_mandal_id: mandal)
    @mandal = SimpleMandal.find(mandal)
  end

  def create
    @sea = Sea.new(sea_params)
    @sea.user_id = current_user.id
    redirect_to words_path unless @sea.save

    @mandal = MandalIdea.new
    @mandal.simple_mandal_id = params[:sea][:mandal]
    @mandal.sea_id = @sea.id
    if @mandal.save
      redirect_to mandal_ideas_path(mandal: @mandal.simple_mandal_id)
    else
      redirect_to mandalarts_path
    end
  end

  private

  def sea_params
    params.require(:sea).permit(:body)
  end
end
