# coding: utf-8
class IdeasController < ApplicationController
  include LikesHelper

  before_action :authorize, only: [:new, :create]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @idea = Idea.find(params[:id])
    @likes_count = Like.where(idea_id: @idea.id).count
  end

  def new
    @idea = Idea.new
  end

  def create
    topic = Topic.find(params[:topic_id])
    @idea = topic.ideas.build(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      flash[:success] = "アイデアを投稿しました"
      @idea.topic.user.notices.create(message: "#{current_user.name}さんがあなたのニーズ「#{@idea.topic.title[0..9]}...」にアイデアを投稿しました")
      redirect_to topic_path(topic)
    else
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:success] = "アイデアを編集しました"
      redirect_to idea_path(id: @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:success] = "アイデアを削除しました"
    redirect_back fallback_location: topics_path
  end

  private
  def idea_params
    params.require(:idea).permit(:body, :topic_id)
  end

  def ensure_correct_user
    @idea = current_user.ideas.find_by(id: params[:id])
    if @idea.nil?
      flash[:danger] = "権限がありません"
      redirect_back fallback_location: topics_path
    end
  end
end
