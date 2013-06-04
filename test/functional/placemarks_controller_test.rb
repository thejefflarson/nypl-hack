require 'test_helper'

class PlacemarksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placemarks)
  end
end
