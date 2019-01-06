# frozen_string_literal: true

class SeasController < ApplicationController
  def index
    @seas = Sea.all
    @sea = Sea.new
  end

  def show
    @sea = Sea.find(params[:id])
    if (@random_words = RandomWordsIdea.left_joins(:sea).where(sea_id: @sea.id).first)
    elsif (@mandal = MandalIdea.left_joins(:sea).where(sea_id: @sea.id).first)
    end
  end

  def create
    @sea = current_user.seas.build(sea_params)
    if @sea.save
      flash[:success] = 'アイデアを投稿しました'
    else
      flash[:danger] = 'アイデア投稿に失敗しました'
    end
    redirect_to seas_path
  end

  private

  def sea_params
    params.require(:sea).permit(:body)
  end
end