require 'test_helper'

class AuthCartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_cart = auth_carts(:one)
  end

  test "should get index" do
    get auth_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_cart_url
    assert_response :success
  end

  test "should create auth_cart" do
    assert_difference('AuthCart.count') do
      post auth_carts_url, params: { auth_cart: { auth_obj_id: @auth_cart.auth_obj_id, auth_obj_meta_json: @auth_cart.auth_obj_meta_json, auth_obj_model_name: @auth_cart.auth_obj_model_name, auth_obj_qty: @auth_cart.auth_obj_qty, auth_user_id: @auth_cart.auth_user_id, auth_visitor_uuid: @auth_cart.auth_visitor_uuid } }
    end

    assert_redirected_to auth_cart_url(AuthCart.last)
  end

  test "should show auth_cart" do
    get auth_cart_url(@auth_cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_cart_url(@auth_cart)
    assert_response :success
  end

  test "should update auth_cart" do
    patch auth_cart_url(@auth_cart), params: { auth_cart: { auth_obj_id: @auth_cart.auth_obj_id, auth_obj_meta_json: @auth_cart.auth_obj_meta_json, auth_obj_model_name: @auth_cart.auth_obj_model_name, auth_obj_qty: @auth_cart.auth_obj_qty, auth_user_id: @auth_cart.auth_user_id, auth_visitor_uuid: @auth_cart.auth_visitor_uuid } }
    assert_redirected_to auth_cart_url(@auth_cart)
  end

  test "should destroy auth_cart" do
    assert_difference('AuthCart.count', -1) do
      delete auth_cart_url(@auth_cart)
    end

    assert_redirected_to auth_carts_url
  end
end
