class TopicsController < ApplicationController

  before_action :authorize, only: [:new, :create]
  
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
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to @topic
  end

  def classfy_topic
    @topics = Topic.where(genre_id: params[:genre_id])
    render 'index'
  end
  private
  def topic_params
    params.require(:topic).permit(:title, :body, :genre_id)
  end
end
