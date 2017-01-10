require 'test_helper'

class AuthBundle2objsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_bundle2obj = auth_bundle2objs(:one)
  end

  test "should get index" do
    get auth_bundle2objs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_bundle2obj_url
    assert_response :success
  end

  test "should create auth_bundle2obj" do
    assert_difference('AuthBundle2obj.count') do
      post auth_bundle2objs_url, params: { auth_bundle2obj: { auth_bundle_id: @auth_bundle2obj.auth_bundle_id, auth_obj_id: @auth_bundle2obj.auth_obj_id, auth_obj_model_name: @auth_bundle2obj.auth_obj_model_name } }
    end

    assert_redirected_to auth_bundle2obj_url(AuthBundle2obj.last)
  end

  test "should show auth_bundle2obj" do
    get auth_bundle2obj_url(@auth_bundle2obj)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_bundle2obj_url(@auth_bundle2obj)
    assert_response :success
  end

  test "should update auth_bundle2obj" do
    patch auth_bundle2obj_url(@auth_bundle2obj), params: { auth_bundle2obj: { auth_bundle_id: @auth_bundle2obj.auth_bundle_id, auth_obj_id: @auth_bundle2obj.auth_obj_id, auth_obj_model_name: @auth_bundle2obj.auth_obj_model_name } }
    assert_redirected_to auth_bundle2obj_url(@auth_bundle2obj)
  end

  test "should destroy auth_bundle2obj" do
    assert_difference('AuthBundle2obj.count', -1) do
      delete auth_bundle2obj_url(@auth_bundle2obj)
    end

    assert_redirected_to auth_bundle2objs_url
  end
end
