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
    if @sea.save
      current_user.change_point(10)
      flash[:success] = 'アイデアを投稿しました。10 ポイント獲得！！'
    else
      redirect_to words_path
    end
    @mandal = MandalIdea.new
    @mandal.simple_mandal_id = params[:sea][:mandal]
    @mandal.sea_id = @sea.id
    if @mandal.save
      redirect_to edit_mandalart_path(@mandal.simple_mandal_id)
    else
      redirect_to mandalarts_path
    end
  end

  private

  def sea_params
    params.require(:sea).permit(:body)
  end
end
