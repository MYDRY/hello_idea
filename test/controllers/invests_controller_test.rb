require 'test_helper'

class InvestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get invests_create_url
    assert_response :success
  end

  test "should get edit" do
    get invests_edit_url
    assert_response :success
  end

end
