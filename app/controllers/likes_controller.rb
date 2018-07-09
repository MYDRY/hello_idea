class LikesController < ApplicationController
  before_action :authorize
  
  def create
    @idea = Idea.find(params[:idea_id])
    like = current_user.likes.build(idea_id: @idea.id)
    like.save
    redirect_to idea_path(@idea.id)
  end

  def destroy
    @idea = Idea.find(params[:id])
    like = Like.find_by(idea_id: @idea.id, user_id: current_user.id)
    like.destroy
    redirect_to idea_path(@idea.id)
  end
end
