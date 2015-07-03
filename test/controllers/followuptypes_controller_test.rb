require 'test_helper'

class FollowuptypesControllerTest < ActionController::TestCase
  setup do
    @followuptype = followuptypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:followuptypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create followuptype" do
    assert_difference('Followuptype.count') do
      post :create, followuptype: {  }
    end

    assert_redirected_to followuptype_path(assigns(:followuptype))
  end

  test "should show followuptype" do
    get :show, id: @followuptype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @followuptype
    assert_response :success
  end

  test "should update followuptype" do
    patch :update, id: @followuptype, followuptype: {  }
    assert_redirected_to followuptype_path(assigns(:followuptype))
  end

  test "should destroy followuptype" do
    assert_difference('Followuptype.count', -1) do
      delete :destroy, id: @followuptype
    end

    assert_redirected_to followuptypes_path
  end
end
