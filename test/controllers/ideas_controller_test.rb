require 'test_helper'

class IdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ideas_show_url
    assert_response :success
  end

end
