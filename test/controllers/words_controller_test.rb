require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get words_index_url
    assert_response :success
  end

end
