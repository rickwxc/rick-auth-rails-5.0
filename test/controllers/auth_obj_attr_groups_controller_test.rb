require 'test_helper'

class AuthObjAttrGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_obj_attr_group = auth_obj_attr_groups(:one)
  end

  test "should get index" do
    get auth_obj_attr_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_obj_attr_group_url
    assert_response :success
  end

  test "should create auth_obj_attr_group" do
    assert_difference('AuthObjAttrGroup.count') do
      post auth_obj_attr_groups_url, params: { auth_obj_attr_group: { name: @auth_obj_attr_group.name } }
    end

    assert_redirected_to auth_obj_attr_group_url(AuthObjAttrGroup.last)
  end

  test "should show auth_obj_attr_group" do
    get auth_obj_attr_group_url(@auth_obj_attr_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_obj_attr_group_url(@auth_obj_attr_group)
    assert_response :success
  end

  test "should update auth_obj_attr_group" do
    patch auth_obj_attr_group_url(@auth_obj_attr_group), params: { auth_obj_attr_group: { name: @auth_obj_attr_group.name } }
    assert_redirected_to auth_obj_attr_group_url(@auth_obj_attr_group)
  end

  test "should destroy auth_obj_attr_group" do
    assert_difference('AuthObjAttrGroup.count', -1) do
      delete auth_obj_attr_group_url(@auth_obj_attr_group)
    end

    assert_redirected_to auth_obj_attr_groups_url
  end
end
