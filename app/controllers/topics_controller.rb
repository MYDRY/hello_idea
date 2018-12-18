# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :authorize, only: %i[new create]
  before_action :ensure_correct_user, only: %i[edit update destroy support]

  def index
    @topics = Topic.all.reverse_order
    @ideal_topics = Genre.find_by(name: '理想').topics
    @trouble_topics = Genre.find_by(name: '問題').topics
    @other_topics = Genre.find_by(name: 'その他').topics
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    redirect_to topics_path if @topic.nil?
    @idea = Idea.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      @topic.user.change_point(10)
      flash[:success] = 'トピックを投稿しました'
      redirect_to @topic
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:success] = 'トピックを編集しました'
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    @topic.user.change_point(-10)
    flash[:success] = 'トピックを削除しました'
    redirect_back fallback_location: topics_path
  end

  def classfy_topic
    @topics = Topic.where(genre_id: params[:genre_id])
    render 'index'
  end

  def support
    redirect_to @topic
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :genre_id)
  end

  def ensure_correct_user
    @topic = Topic.find(params[:id])
    return if @topic.user_id == current_user.id

    flash[:danger] = '権限がありません'
    redirect_back fallback_location: topics_path
  end
end
