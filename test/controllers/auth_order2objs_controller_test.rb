require 'test_helper'

class AuthOrder2objsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_order2obj = auth_order2objs(:one)
  end

  test "should get index" do
    get auth_order2objs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_order2obj_url
    assert_response :success
  end

  test "should create auth_order2obj" do
    assert_difference('AuthOrder2obj.count') do
      post auth_order2objs_url, params: { auth_order2obj: { auth_gst: @auth_order2obj.auth_gst, auth_obj_display_name: @auth_order2obj.auth_obj_display_name, auth_obj_id: @auth_order2obj.auth_obj_id, auth_obj_meta_json: @auth_order2obj.auth_obj_meta_json, auth_obj_model_name: @auth_order2obj.auth_obj_model_name, auth_obj_qty: @auth_order2obj.auth_obj_qty, auth_obj_unitprice: @auth_order2obj.auth_obj_unitprice, auth_order_id: @auth_order2obj.auth_order_id, auth_total: @auth_order2obj.auth_total } }
    end

    assert_redirected_to auth_order2obj_url(AuthOrder2obj.last)
  end

  test "should show auth_order2obj" do
    get auth_order2obj_url(@auth_order2obj)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_order2obj_url(@auth_order2obj)
    assert_response :success
  end

  test "should update auth_order2obj" do
    patch auth_order2obj_url(@auth_order2obj), params: { auth_order2obj: { auth_gst: @auth_order2obj.auth_gst, auth_obj_display_name: @auth_order2obj.auth_obj_display_name, auth_obj_id: @auth_order2obj.auth_obj_id, auth_obj_meta_json: @auth_order2obj.auth_obj_meta_json, auth_obj_model_name: @auth_order2obj.auth_obj_model_name, auth_obj_qty: @auth_order2obj.auth_obj_qty, auth_obj_unitprice: @auth_order2obj.auth_obj_unitprice, auth_order_id: @auth_order2obj.auth_order_id, auth_total: @auth_order2obj.auth_total } }
    assert_redirected_to auth_order2obj_url(@auth_order2obj)
  end

  test "should destroy auth_order2obj" do
    assert_difference('AuthOrder2obj.count', -1) do
      delete auth_order2obj_url(@auth_order2obj)
    end

    assert_redirected_to auth_order2objs_url
  end
end
