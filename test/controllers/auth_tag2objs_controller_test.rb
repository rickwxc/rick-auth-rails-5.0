require 'test_helper'

class AuthTag2objsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_tag2obj = auth_tag2objs(:one)
  end

  test "should get index" do
    get auth_tag2objs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_tag2obj_url
    assert_response :success
  end

  test "should create auth_tag2obj" do
    assert_difference('AuthTag2obj.count') do
      post auth_tag2objs_url, params: { auth_tag2obj: { auth_obj_id: @auth_tag2obj.auth_obj_id, auth_tag_id: @auth_tag2obj.auth_tag_id, model: @auth_tag2obj.model } }
    end

    assert_redirected_to auth_tag2obj_url(AuthTag2obj.last)
  end

  test "should show auth_tag2obj" do
    get auth_tag2obj_url(@auth_tag2obj)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_tag2obj_url(@auth_tag2obj)
    assert_response :success
  end

  test "should update auth_tag2obj" do
    patch auth_tag2obj_url(@auth_tag2obj), params: { auth_tag2obj: { auth_obj_id: @auth_tag2obj.auth_obj_id, auth_tag_id: @auth_tag2obj.auth_tag_id, model: @auth_tag2obj.model } }
    assert_redirected_to auth_tag2obj_url(@auth_tag2obj)
  end

  test "should destroy auth_tag2obj" do
    assert_difference('AuthTag2obj.count', -1) do
      delete auth_tag2obj_url(@auth_tag2obj)
    end

    assert_redirected_to auth_tag2objs_url
  end
end
