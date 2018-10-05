# coding: utf-8
class LikesController < ApplicationController
  before_action :authorize
  
  def create
    @idea = Idea.find(params[:idea_id])
    like = current_user.likes.build(idea_id: @idea.id)
    like.save
    view_context.spawn_like_notice(@idea)
    flash[:success] = "いいねしました"
    redirect_back fallback_location: topic_path(id: @idea.topic)
  end

  def destroy
    @idea = Idea.find(params[:id])
    like = Like.find_by(idea_id: @idea.id, user_id: current_user.id)
    like.destroy 
    flash[:success] = "いいねを取り消しました"
    redirect_back fallback_location: topic_path(id: @idea.topic)
  end
end
