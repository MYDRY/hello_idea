# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authorize

  def create
    @idea = Idea.find(params[:idea_id])
    like = current_user.likes.build(idea_id: @idea.id)
    like.save
    unless current_user == @idea.user
      current_user.change_point(5)
      @idea.user.change_point(20)
    end
    view_context.spawn_like_notice(@idea)
    @idea.reload
  end

  def destroy
    @idea = Idea.find(params[:id])
    like = Like.find_by(idea_id: @idea.id, user_id: current_user.id)
    like.destroy
    unless current_user == @idea.user
      current_user.change_point(-5)
      @idea.user.change_point(-20)
    end
    @idea.reload
  end
end
