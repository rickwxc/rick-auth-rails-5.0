require 'test_helper'

class AuthObjAttrTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_obj_attr_type = auth_obj_attr_types(:one)
  end

  test "should get index" do
    get auth_obj_attr_types_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_obj_attr_type_url
    assert_response :success
  end

  test "should create auth_obj_attr_type" do
    assert_difference('AuthObjAttrType.count') do
      post auth_obj_attr_types_url, params: { auth_obj_attr_type: { auth_obj_attr_group_id: @auth_obj_attr_type.auth_obj_attr_group_id, idx: @auth_obj_attr_type.idx, name: @auth_obj_attr_type.name } }
    end

    assert_redirected_to auth_obj_attr_type_url(AuthObjAttrType.last)
  end

  test "should show auth_obj_attr_type" do
    get auth_obj_attr_type_url(@auth_obj_attr_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_obj_attr_type_url(@auth_obj_attr_type)
    assert_response :success
  end

  test "should update auth_obj_attr_type" do
    patch auth_obj_attr_type_url(@auth_obj_attr_type), params: { auth_obj_attr_type: { auth_obj_attr_group_id: @auth_obj_attr_type.auth_obj_attr_group_id, idx: @auth_obj_attr_type.idx, name: @auth_obj_attr_type.name } }
    assert_redirected_to auth_obj_attr_type_url(@auth_obj_attr_type)
  end

  test "should destroy auth_obj_attr_type" do
    assert_difference('AuthObjAttrType.count', -1) do
      delete auth_obj_attr_type_url(@auth_obj_attr_type)
    end

    assert_redirected_to auth_obj_attr_types_url
  end
end
