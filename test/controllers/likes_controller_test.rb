require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user0)
    @idea = ideas(:idea0)
    log_in @user
  end

  def teardown
    log_out
  end

  test "should get create" do
    post idea_likes_path(idea_id: @idea.id)
    assert_response :redirect
  end

  test "should get destroy" do
    delete like_path(id: @idea)
    assert_response :redirect
  end

end
