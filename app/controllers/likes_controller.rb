class LikesController < ApplicationController
  before_action :authorize
  
  def create
    @idea = Idea.find(params[:idea_id])
    like = current_user.likes.build(idea_id: @idea.id)
    like.save
    flash[:success] = "いいねしました"
    redirect_to idea_path(@idea.id)
  end

  def destroy
    @idea = Idea.find(params[:id])
    like = Like.find_by(idea_id: @idea.id, user_id: current_user.id)
    like.destroy 
    flash[:success] = "いいねを取り消しました"
    redirect_to idea_path(@idea.id)
  end
end
