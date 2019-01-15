# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authorize

  def create
    @liked_content = params[:likable_type] == 'Idea' ? Idea.find(params[:likable_id]) : Sea.find(params[:likable_id])
    like = @liked_content.likes.build(user_id: current_user.id)
    like.save
    unless current_user == @liked_content.user
      current_user.change_point(5)
      @liked_content.user.change_point(20)
    end
    view_context.spawn_like_notice(@liked_content)
    @liked_content.reload
  end

  def destroy
    likable_type = params[:likable_type]
    @liked_content = params[:likable_type] == 'Idea' ? Idea.find(params[:likable_id]) : Sea.find(params[:likable_id])
    like = Like.find_by(likable_id: @liked_content.id, user_id: current_user.id, likable_type: likable_type)
    like.destroy
    unless current_user == @liked_content.user
      current_user.change_point(-5)
      @liked_content.user.change_point(-20)
    end
    @liked_content.reload
  end
end
