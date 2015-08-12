require 'test_helper'

class FollowupsControllerTest < ActionController::TestCase
  setup do
    @followup = followups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:followups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create followup" do
    assert_difference('Followup.count') do
      post :create, followup: { case_id: @followup.case_id, contact_id: @followup.contact_id, d_next_followed_up_date: @followup.d_next_followed_up_date, followed_up_by: @followup.followed_up_by, followed_up_date: @followup.followed_up_date, followed_up_type_id: @followup.followed_up_type_id, next_followed_up_by: @followup.next_followed_up_by, next_followed_up_type_id: @followup.next_followed_up_type_id, v_outcome: @followup.v_outcome }
    end

    assert_redirected_to followup_path(assigns(:followup))
  end

  test "should show followup" do
    get :show, id: @followup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @followup
    assert_response :success
  end

  test "should update followup" do
    patch :update, id: @followup, followup: { case_id: @followup.case_id, contact_id: @followup.contact_id, d_next_followed_up_date: @followup.d_next_followed_up_date, followed_up_by: @followup.followed_up_by, followed_up_date: @followup.followed_up_date, followed_up_type_id: @followup.followed_up_type_id, next_followed_up_by: @followup.next_followed_up_by, next_followed_up_type_id: @followup.next_followed_up_type_id, v_outcome: @followup.v_outcome }
    assert_redirected_to followup_path(assigns(:followup))
  end

  test "should destroy followup" do
    assert_difference('Followup.count', -1) do
      delete :destroy, id: @followup
    end

    assert_redirected_to followups_path
  end
end
