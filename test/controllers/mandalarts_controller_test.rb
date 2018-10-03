require 'test_helper'

class MandalartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mandalarts_index_url
    assert_response :success
  end

end
