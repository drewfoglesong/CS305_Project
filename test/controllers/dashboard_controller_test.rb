require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get add_remove_students" do
    get :add_remove_students
    assert_response :success
  end

end
