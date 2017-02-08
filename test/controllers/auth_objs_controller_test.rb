require 'test_helper'

class AuthObjsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_obj = auth_objs(:one)
  end

  test "should get index" do
    get auth_objs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_obj_url
    assert_response :success
  end

  test "should create auth_obj" do
    assert_difference('AuthObj.count') do
      post auth_objs_url, params: { auth_obj: { auth_descr: @auth_obj.auth_descr, auth_name: @auth_obj.auth_name, auth_total: @auth_obj.auth_total, auth_uuid: @auth_obj.auth_uuid } }
    end

    assert_redirected_to auth_obj_url(AuthObj.last)
  end

  test "should show auth_obj" do
    get auth_obj_url(@auth_obj)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_obj_url(@auth_obj)
    assert_response :success
  end

  test "should update auth_obj" do
    patch auth_obj_url(@auth_obj), params: { auth_obj: { auth_descr: @auth_obj.auth_descr, auth_name: @auth_obj.auth_name, auth_total: @auth_obj.auth_total, auth_uuid: @auth_obj.auth_uuid } }
    assert_redirected_to auth_obj_url(@auth_obj)
  end

  test "should destroy auth_obj" do
    assert_difference('AuthObj.count', -1) do
      delete auth_obj_url(@auth_obj)
    end

    assert_redirected_to auth_objs_url
  end
end
