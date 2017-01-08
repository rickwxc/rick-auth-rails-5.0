require 'test_helper'

class AuthOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_order = auth_orders(:one)
  end

  test "should get index" do
    get auth_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_order_url
    assert_response :success
  end

  test "should create auth_order" do
    assert_difference('AuthOrder.count') do
      post auth_orders_url, params: { auth_order: { auth_gst: @auth_order.auth_gst, auth_meta_json: @auth_order.auth_meta_json, auth_note: @auth_order.auth_note, auth_orderst_id: @auth_order.auth_orderst_id, auth_payst_id: @auth_order.auth_payst_id, auth_total: @auth_order.auth_total, auth_user_id: @auth_order.auth_user_id, auth_visitor_uuid: @auth_order.auth_visitor_uuid } }
    end

    assert_redirected_to auth_order_url(AuthOrder.last)
  end

  test "should show auth_order" do
    get auth_order_url(@auth_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_order_url(@auth_order)
    assert_response :success
  end

  test "should update auth_order" do
    patch auth_order_url(@auth_order), params: { auth_order: { auth_gst: @auth_order.auth_gst, auth_meta_json: @auth_order.auth_meta_json, auth_note: @auth_order.auth_note, auth_orderst_id: @auth_order.auth_orderst_id, auth_payst_id: @auth_order.auth_payst_id, auth_total: @auth_order.auth_total, auth_user_id: @auth_order.auth_user_id, auth_visitor_uuid: @auth_order.auth_visitor_uuid } }
    assert_redirected_to auth_order_url(@auth_order)
  end

  test "should destroy auth_order" do
    assert_difference('AuthOrder.count', -1) do
      delete auth_order_url(@auth_order)
    end

    assert_redirected_to auth_orders_url
  end
end
