file_name = ARGV[0]
message_string = ''

begin
  file = open(file_name)
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
