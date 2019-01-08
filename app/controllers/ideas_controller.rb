# frozen_string_literal: true

class IdeasController < ApplicationController
  include LikesHelper
  include InvestsHelper

  before_action :authorize, only: %i[new create]
  before_action :ensure_correct_user, only: %i[edit update destroy]

  def show
    @idea = Idea.find_by(id: params[:id])
    if @idea.nil?
      redirect_to topics_path
    else
      @likes_count = Like.where(idea_id: @idea.id).count
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    topic = Topic.find(params[:topic_id])
    @idea = topic.ideas.build(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      unless topic.user == @idea.user
        topic.user.change_point(20)
        @idea.user.change_point(10)
        rates = view_context.calc_invest_rates(topic)
        rates.each do |rate|
          invest_user = User.find(rate[:user_id])
          unless invest_user == @idea.user
            additional_point = (topic.support * rate[:rate] / 10).to_i
            invest_user.change_point(additional_point)
            view_context.spawn_new_dividend_notice(topic, invest_user, additional_point)
          end
        end
      end
      flash[:success] = 'アイデアを投稿しました'
      view_context.spawn_new_idea_notice(topic)
    else
      flash[:danger] = 'アイデア投稿に失敗しました'
    end
    redirect_to topic_path(topic)
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:success] = 'アイデアを編集しました'
      redirect_to idea_path(id: @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    unless @idea.topic.user == @idea.user
      @idea.topic.user.change_point(-20)
      @idea.user.change_point(-10)
    end
    @idea.destroy
    flash[:success] = 'アイデアを削除しました'
    redirect_back fallback_location: topics_path
  end

  private

  def idea_params
    params.require(:idea).permit(:body, :topic_id)
  end

  def ensure_correct_user
    @idea = current_user.ideas.find_by(id: params[:id])
    return unless @idea.nil?

    flash[:danger] = '権限がありません'
    redirect_back fallback_location: topics_path
  end
end
