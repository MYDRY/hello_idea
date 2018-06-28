require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "users show page should exist" do
    @user = users(:user0)
    get user_url(@user)
    assert_response :success
  end
end
