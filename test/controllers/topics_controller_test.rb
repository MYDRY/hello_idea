require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "topics index page should exist" do
    get topics_url
    assert_response :success
  end

  test "topics show page should exist" do
    @topic = topics(:topic0)
    get topic_path(@topic)
    assert_response :success
  end
end
