require 'test_helper'

class MandalIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mandal_ideas_index_url
    assert_response :success
  end

  test "should get create" do
    get mandal_ideas_create_url
    assert_response :success
  end

end
