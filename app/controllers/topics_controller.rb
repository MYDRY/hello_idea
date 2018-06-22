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
end
