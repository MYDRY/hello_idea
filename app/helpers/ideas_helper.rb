# coding: utf-8
module IdeasHelper
  def spawn_new_idea_notice(topic)
    subscribe_user = topic.user
    if subscribe_user == current_user
      return
    end
    topic_title_string = topic.title.length > 10 ? topic.title[0..9] + '...' : topic.title
    subscribe_user.notices.create(message: "#{current_user.name}さんがあなたのニーズ「#{topic_title_string}」に\nアイデアを投稿しました")
  end
end
