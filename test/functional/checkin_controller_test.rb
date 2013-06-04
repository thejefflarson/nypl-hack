require 'test_helper'

class CheckinControllerTest < ActionController::TestCase

  test "should respond to fsq stuff" do
  	post :create, :post => { :title => 'Some title'}
  	assert_response :success
  end

end
