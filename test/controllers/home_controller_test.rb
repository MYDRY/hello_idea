require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get home_top_url
    assert_response :success
  end

  test "should get root" do
    get root_url
    assert_response :success
  end
end
