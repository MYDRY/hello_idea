class PostController < ApplicationController
  def index
    @posts = Genre.all
    @ideas = Idea.all
  end

  def ideal
	current_genre = Genre.find_by(name: params[:action])
	@posts = current_genre.ideas
  end

  def trouble
    current_genre = Genre.find_by(name: params[:action])
	@posts = current_genre.ideas
  end
  
  def other
    current_genre = Genre.find_by(name: params[:action])
	@posts = current_genre.ideas
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
