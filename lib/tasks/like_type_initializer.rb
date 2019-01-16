# 以下のコマンドで実行してください。
#
# RAILS_ENV=production bundle exec rake runner lib/tasks/like_type_initializer.rb
#

# frozen_string_literal: true

unless Like.find(1).likable_type.nil?
  p 'Like type initializing has done.'
  exit
end

Like.transaction do
  Like.all.each do |like|
    like.likable_type = 'Idea'
    like.save
  end
end
