class TopicsController < ApplicationController
  before_action :authorize, only: [:new, :create]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @topics = Topic.all
    @ideal_topics = Genre.find_by(name: 'ideal').topics
    @trouble_topics = Genre.find_by(name: 'trouble').topics
    @other_topics = Genre.find_by(name: 'other').topics
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "トピックを投稿しました"
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
      flash[:success] = "トピックを編集しました"
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:success] = "トピックを削除しました"
    redirect_to topics_path
  end

  def classfy_topic
    @topics = Topic.where(genre_id: params[:genre_id])
    render 'index'
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :body, :genre_id)
  end

  def ensure_correct_user
    @topic = Topic.find(params[:id])
    if @topic.user_id != current_user.id
      redirect_to topics_path
    end
  end
end
