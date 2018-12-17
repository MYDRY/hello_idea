# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = users(:user0)
  #   log_in @user
  # end

  # def teardown
  #   log_out
  # end

  # test "users show page should exist" do
  #   get user_path(@user)
  #   assert_response :success
  # end

  # test "users create action should create new User" do
  #   assert_difference('User.count') do
  #     post users_path(user: { name: 'create_test', email: 'create_test@mail.com' })
  #   end
  #   assert_response :redirect
  #   assert_redirected_to user_path(assigns(:user))
  # end

  # test "login page should work" do
  #   post login_path(user: { name: @user.name, email: @user.email })
  #   assert_response :redirect
  # end

  # test "users edit action renders edit form" do
  #   get edit_user_path(id: @user)
  #   assert_response :success
  #   assert_template 'users/edit'
  # end

  # test "users update action should modify users profile" do
  #   patch user_path(id: @user, user: { name: @user.name })
  #   assert_response :redirect
  # end
end
