User.transaction do
  User.all.each do |user|
    user.notices.create(message: 'Notice from developers.')
  end
end
