class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    topic = Topic.find(params[:topic_id])
    @idea = topic.ideas.build(idea_params)
    @idea.save
    redirect_to topic_path(topic)
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :body, :topic_id)
  end
end
