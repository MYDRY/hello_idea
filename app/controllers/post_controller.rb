class PostController < ApplicationController
  def index
  end

  def ideal
	current_genre = Genre.find_by(name: "ideal")
	@posts = current_genre.ideas
  end

  def trouble
  end
  
  def other
  end
  
end
