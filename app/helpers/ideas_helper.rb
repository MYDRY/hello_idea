# frozen_string_literal: true

module IdeasHelper
  def spawn_new_idea_notice(topic)
    subscribe_user = topic.user
    return if subscribe_user == current_user

    topic_title_string = topic.title.length > 10 ? topic.title[0..9] + '...' : topic.title
    subscribe_user.notices.create(message: "#{current_user.name}さんがあなたのニーズ「#{topic_title_string}」に\nアイデアを投稿しました", 
                                  link: "#{topic_path(id: topic)}"
                                 )
  end
end
