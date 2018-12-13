# coding: utf-8
class LikesController < ApplicationController
  before_action :authorize

  def create
    @idea = Idea.find(params[:idea_id])
    like = current_user.likes.build(idea_id: @idea.id)
    like.save
    @idea.user.change_point 10
    view_context.spawn_like_notice(@idea)
#    flash[:success] = "いいねしました"
    @idea.reload
  end

  def destroy
    @idea = Idea.find(params[:id])
    like = Like.find_by(idea_id: @idea.id, user_id: current_user.id)
    like.destroy
    @idea.user.change_point -10
#    flash[:success] = "いいねを取り消しました"
    @idea.reload
  end
end
