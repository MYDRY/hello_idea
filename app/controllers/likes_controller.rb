class LikesController < ApplicationController

  before_action :authorize
  
  def create
    like = current_user.likes.build(idea_id: params[:idea_id])
    like.save
    redirect_back fallback_location: root_path
  end

  def destroy
    like = Like.find_by(idea_id: params[:id], user_id: current_user.id)
    like.destroy
    redirect_back fallback_location: root_path    
  end
end
