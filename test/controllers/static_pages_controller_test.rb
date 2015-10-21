require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
  	get :home
  	assert_response :success
  end

  test "should get help" do
  	get :help 
  	assert_response :success
  end

  test "should get add_remove_student" do
  	get :add_remove_student
  	assert_response :success
  end

end
