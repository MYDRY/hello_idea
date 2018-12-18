# frozen_string_literal: true

message_filename = 'lib/tasks/message.txt'
message_string = ''

begin
  file = open(message_filename)
  message_string = file.read
rescue StandardError => err
  puts '[ERROR] Failed to read message file.'
  puts err.message
  exit
end

p message_string
p 'Are you sure ? (y/n)'

ans = gets
exit if ans == 'y\n'

User.transaction do
  User.all.each do |user|
    user.notices.create(message: message_string)
  end
end

File.delete(message_filename)
