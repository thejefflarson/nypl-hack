require 'test_helper'

class PlacemarksControllerTest < ActionController::TestCase
  setup do
    @placemark = placemarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placemarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create placemark" do
    assert_difference('Placemark.count') do
      post :create, placemark: { latlon: @placemark.latlon, slug: @placemark.slug, year2: @placemark.year2, year: @placemark.year }
    end

    assert_redirected_to placemark_path(assigns(:placemark))
  end

  test "should show placemark" do
    get :show, id: @placemark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @placemark
    assert_response :success
  end

  test "should update placemark" do
    put :update, id: @placemark, placemark: { latlon: @placemark.latlon, slug: @placemark.slug, year2: @placemark.year2, year: @placemark.year }
    assert_redirected_to placemark_path(assigns(:placemark))
  end

  test "should destroy placemark" do
    assert_difference('Placemark.count', -1) do
      delete :destroy, id: @placemark
    end

    assert_redirected_to placemarks_path
  end
end
