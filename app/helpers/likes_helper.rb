# coding: utf-8
module LikesHelper
  def already_liked?(idea)
    current_user.likes.exists?(idea_id: idea.id)
  end

  def spawn_like_notice(idea)
    subscribe_user = idea.user
    if subscribe_user == current_user
      return
    end
    idea_body_string = idea.body.length > 10 ? idea.body[0..9] + '...' : idea.body
    subscribe_user.notices.create(message: "#{current_user.name}さんがあなたのアイデア「#{idea_body_string}」に\nいいね！しました")
  end
end
