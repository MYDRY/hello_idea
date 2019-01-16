# frozen_string_literal: true

module LikesHelper
  def already_liked?(liked_content)
    current_user.likes.exists?(likable_id: liked_content.id, likable_type: liked_content.is_a?(Idea) ? 'Idea' : 'Sea')
  end

  def spawn_like_notice(liked_content)
    subscribe_user = liked_content.user
    return if subscribe_user == current_user

    liked_content_body_string = liked_content.body.length > 10 ? liked_content.body[0..9] + '...' : liked_content.body
    notice_link = (liked_content.is_a?(Idea) ? 'Idea' : 'Sea') == 'Idea' ? idea_path(id: liked_content).to_s : sea_path(id: liked_content).to_s
    subscribe_user.notices.create(
      message: "#{current_user.name}さんがあなたのアイデア「#{liked_content_body_string}」に\nいいね！しました\n 20 ポイント獲得！！",
      link:    notice_link)
  end
end
