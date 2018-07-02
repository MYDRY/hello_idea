ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all
  
  def log_in(user)
    post login_path(user: { name: user.name, email: user.email })
  end

  def log_out
    get logout_path
  end
end
