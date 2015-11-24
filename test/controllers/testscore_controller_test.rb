require 'test_helper'

class TestscoreControllerTest < ActionController::TestCase
  test "should get scores" do
    get :scores
    assert_response :success
  end

end
