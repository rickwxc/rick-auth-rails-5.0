require 'test_helper'

class AuthObjAttrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_obj_attr = auth_obj_attrs(:one)
  end

  test "should get index" do
    get auth_obj_attrs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_obj_attr_url
    assert_response :success
  end

  test "should create auth_obj_attr" do
    assert_difference('AuthObjAttr.count') do
      post auth_obj_attrs_url, params: { auth_obj_attr: { auth_meta_type_id: @auth_obj_attr.auth_meta_type_id, idx: @auth_obj_attr.idx, model: @auth_obj_attr.model, obj_id: @auth_obj_attr.obj_id, value: @auth_obj_attr.value } }
    end

    assert_redirected_to auth_obj_attr_url(AuthObjAttr.last)
  end

  test "should show auth_obj_attr" do
    get auth_obj_attr_url(@auth_obj_attr)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_obj_attr_url(@auth_obj_attr)
    assert_response :success
  end

  test "should update auth_obj_attr" do
    patch auth_obj_attr_url(@auth_obj_attr), params: { auth_obj_attr: { auth_meta_type_id: @auth_obj_attr.auth_meta_type_id, idx: @auth_obj_attr.idx, model: @auth_obj_attr.model, obj_id: @auth_obj_attr.obj_id, value: @auth_obj_attr.value } }
    assert_redirected_to auth_obj_attr_url(@auth_obj_attr)
  end

  test "should destroy auth_obj_attr" do
    assert_difference('AuthObjAttr.count', -1) do
      delete auth_obj_attr_url(@auth_obj_attr)
    end

    assert_redirected_to auth_obj_attrs_url
  end
end
