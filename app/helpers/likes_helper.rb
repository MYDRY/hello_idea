module LikesHelper
  def already_liked?(idea)
    current_user.likes.exists?(idea_id: idea.id)
  end
end
