require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest 
  test "users show page should exist" do
    @user = users(:user0)
    get user_path(@user)
    assert_response :success
  end

  test "users create action should create new User" do
    assert_difference('User.count') do
      post users_path(user: { name: 'create_test', email: 'create_test@mail.com' })
    end
    assert_response :redirect
    assert_redirected_to user_path(assigns(:user))
  end

  test "login page should work" do
    @user = users(:user0)    
    post login_path(user: { name: @user.name, email: @user.email })
    assert_response :redirect
  end
end
