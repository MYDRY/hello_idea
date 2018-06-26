module TopicHelper
  def topic_tag_toggle(genre_name)
    genre = Genre.find_by(name: genre_name)
    "button_to '#{genre_name}', action: 'classfy_topic', genre_id: #{genre.id}"
  end
end
