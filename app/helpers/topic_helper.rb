# frozen_string_literal: true

module TopicHelper
  def spawn_new_dividend_notice(topic, subscribe_user, amount)
    topic_title_string = topic.title.length > 10 ? topic.title[0..9] + '...' : topic.title
    subscribe_user.notices.create(message: "あなたが投資したニーズ「#{topic_title_string}」に\nアイデアが投稿されました。#{amount} ポイント 獲得！",
                                  link:    topic_path(id: topic).to_s)
  end

  def spawn_new_invest_notice(topic, invest_user, amount)
    topic_title_string = topic.title.length > 10 ? topic.title[0..9] + '...' : topic.title
    topic.user.notices.create(message: "#{invest_user.name}さんが\nあなたが投稿したニーズ「#{topic_title_string}」に\n#{amount} ポイント 投資しました。",
                              link:    topic_path(id: topic).to_s)
  end
end
