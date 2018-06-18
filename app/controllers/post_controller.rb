class PostController < ApplicationController
  def index
    @posts = Genre.all
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
end
