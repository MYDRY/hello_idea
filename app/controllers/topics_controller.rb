class TopicsController < ApplicationController
  def index
    @genres = Genre.all
    @topics = Topic.all
  end

  def ideal
	  current_genre = Genre.find_by(name: params[:action])
	  @topics = current_genre.topics
  end

  def trouble
    current_genre = Genre.find_by(name: params[:action])
	  @topics = current_genre.topics
  end

  def other
    current_genre = Genre.find_by(name: params[:action])
	@topics = current_genre.topics
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
#    redirect_to topic_path(@topic)
    redirect_to @topic
  end


  private
  def topic_params
    params.require(:topic).permit(:title, :body, :genre_id)
  end
end
