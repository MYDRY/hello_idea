require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topics_url
    assert_response :success
  end
end
