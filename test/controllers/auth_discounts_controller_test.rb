require 'test_helper'

class AuthDiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_discount = auth_discounts(:one)
  end

  test "should get index" do
    get auth_discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_discount_url
    assert_response :success
  end

  test "should create auth_discount" do
    assert_difference('AuthDiscount.count') do
      post auth_discounts_url, params: { auth_discount: { amt: @auth_discount.amt, model: @auth_discount.model, obj_id: @auth_discount.obj_id } }
    end

    assert_redirected_to auth_discount_url(AuthDiscount.last)
  end

  test "should show auth_discount" do
    get auth_discount_url(@auth_discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_discount_url(@auth_discount)
    assert_response :success
  end

  test "should update auth_discount" do
    patch auth_discount_url(@auth_discount), params: { auth_discount: { amt: @auth_discount.amt, model: @auth_discount.model, obj_id: @auth_discount.obj_id } }
    assert_redirected_to auth_discount_url(@auth_discount)
  end

  test "should destroy auth_discount" do
    assert_difference('AuthDiscount.count', -1) do
      delete auth_discount_url(@auth_discount)
    end

    assert_redirected_to auth_discounts_url
  end
end
