message_filename = 'lib/tasks/message.txt'
message_string = ''

begin
  file = open(message_filename)
  message_string = file.read
rescue => err
  puts '[ERROR] Failed to read message file.'
  puts err.message
end

User.transaction do
  User.all.each do |user|
    user.notices.create(message: message_string)
  end
end

File.delete(message_filename)
