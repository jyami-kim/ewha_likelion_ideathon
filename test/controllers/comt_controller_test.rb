require 'test_helper'

class ComtControllerTest < ActionController::TestCase
  test "should get com_create" do
    get :com_create
    assert_response :success
  end

  test "should get com_destroy" do
    get :com_destroy
    assert_response :success
  end

end
