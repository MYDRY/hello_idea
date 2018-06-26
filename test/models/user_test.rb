require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'example', email: 'example@com')
    @user.save
  end

  test "name should be present" do
    @user.name = '  '
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = '   '
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user1 = User.new(name: 'example2', email: 'example@com')
    assert_not @user1.valid?
  end

  test "name should be unique" do
    @user1 = User.new(name: 'example', email: 'example2@com')
    assert_not @user1.valid?
  end
end
