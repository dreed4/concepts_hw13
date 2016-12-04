require 'test_helper'

class PassmakerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passmaker_index_url
    assert_response :success
  end

end
