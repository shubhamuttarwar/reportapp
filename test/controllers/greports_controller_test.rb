require 'test_helper'

class GreportsControllerTest < ActionController::TestCase
  setup do
    @greport = greports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:greports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create greport" do
    assert_difference('Greport.count') do
      post :create, greport: { marksobt: @greport.marksobt, marksout: @greport.marksout, name: @greport.name, result: @greport.result, roll: @greport.roll, sgpa: @greport.sgpa }
    end

    assert_redirected_to greport_path(assigns(:greport))
  end

  test "should show greport" do
    get :show, id: @greport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @greport
    assert_response :success
  end

  test "should update greport" do
    patch :update, id: @greport, greport: { marksobt: @greport.marksobt, marksout: @greport.marksout, name: @greport.name, result: @greport.result, roll: @greport.roll, sgpa: @greport.sgpa }
    assert_redirected_to greport_path(assigns(:greport))
  end

  test "should destroy greport" do
    assert_difference('Greport.count', -1) do
      delete :destroy, id: @greport
    end

    assert_redirected_to greports_path
  end
end
