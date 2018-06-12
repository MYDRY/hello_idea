require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_index_url
    assert_response :success
  end

  test "should get ideal page" do
    get post_ideal_url
    assert_response :success
  end

  test "should get trouble page" do
    get post_trouble_url
    assert_response :success
  end
end
