require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'example', email: 'example@com')
  end

  test "name should be present" do
    @user.name = '  ';
    assert_not @user.valid?
  end
end
