# frozen_string_literal: true

class SeasController < ApplicationController
  before_action :authorize, only:  %i[index create]

  def index
    @topics = Topic.order(created_at: :desc)
    @ideal_topics = Genre.find_by(name: '理想').topics.order(created_at: :desc)
    @trouble_topics = Genre.find_by(name: '問題').topics.order(created_at: :desc)
    @other_topics = Genre.find_by(name: 'その他').topics.order(created_at: :desc)
    @point_ordered_topics = Topic.order({ support: :desc }, created_at: :desc)
    @seas = Sea.all.order(created_at: :desc)
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
      @sea.user.change_point(10)
      flash[:success] = 'アイデアを投稿しました。10 ポイント獲得！！'
    else
      flash[:danger] = 'アイデア投稿に失敗しました'
    end
    redirect_to seas_path
  end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.destroy
    flash[:success] = 'アイデアを削除しました'
    redirect_to seas_path
  end

  private

  def sea_params
    params.require(:sea).permit(:body)
  end
end
