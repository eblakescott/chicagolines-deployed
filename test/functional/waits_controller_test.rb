require 'test_helper'

class WaitsControllerTest < ActionController::TestCase
  setup do
    @wait = waits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wait" do
    assert_difference('Wait.count') do
      post :create, wait: { duration: @wait.duration, location_id: @wait.location_id }
    end

    assert_redirected_to wait_path(assigns(:wait))
  end

  test "should show wait" do
    get :show, id: @wait
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wait
    assert_response :success
  end

  test "should update wait" do
    put :update, id: @wait, wait: { duration: @wait.duration, location_id: @wait.location_id }
    assert_redirected_to wait_path(assigns(:wait))
  end

  test "should destroy wait" do
    assert_difference('Wait.count', -1) do
      delete :destroy, id: @wait
    end

    assert_redirected_to waits_path
  end
end
