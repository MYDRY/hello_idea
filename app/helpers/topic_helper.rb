# frozen_string_literal: true

module TopicHelper
  def spawn_new_dividend_notice(topic, subscribe_user)
    topic_title_string = topic.title.length > 10 ? topic.title[0..9] + '...' : topic.title
    subscribe_user.notices.create(message: "あなたが投資したニーズ「#{topic_title_string}」に\nアイデアが投稿されました。",
                                  link:     topic_path(id: topic).to_s)
  end
  
  def spawn_new_invest_notice(topic, invest_user)
    topic_title_string = topic.title.length > 10 ? topic.title[0..9] + '...' : topic.title
    subscribe_user.notices.create(message: "#{invest_user.name}さんが\n
                                            あなたが投稿したニーズ「#{topic_title_string}」に投資しました。",
                                  link:     topic_path(id: topic).to_s)
  end
end
