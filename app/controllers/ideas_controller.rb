class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
  end

def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(topic_id: params[:id])
    @idea.save
    redirect_to topic_path
  end


  private
  def idea_params
    params.require(:idea).permit(:title, :body, :topic_id)
  end
end
