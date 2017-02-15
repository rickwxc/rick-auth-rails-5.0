require 'test_helper'

class AuthCouponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_coupon = auth_coupons(:one)
  end

  test "should get index" do
    get auth_coupons_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_coupon_url
    assert_response :success
  end

  test "should create auth_coupon" do
    assert_difference('AuthCoupon.count') do
      post auth_coupons_url, params: { auth_coupon: { code: @auth_coupon.code, expire_at: @auth_coupon.expire_at, is_enabled: @auth_coupon.is_enabled, name: @auth_coupon.name, val: @auth_coupon.val } }
    end

    assert_redirected_to auth_coupon_url(AuthCoupon.last)
  end

  test "should show auth_coupon" do
    get auth_coupon_url(@auth_coupon)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_coupon_url(@auth_coupon)
    assert_response :success
  end

  test "should update auth_coupon" do
    patch auth_coupon_url(@auth_coupon), params: { auth_coupon: { code: @auth_coupon.code, expire_at: @auth_coupon.expire_at, is_enabled: @auth_coupon.is_enabled, name: @auth_coupon.name, val: @auth_coupon.val } }
    assert_redirected_to auth_coupon_url(@auth_coupon)
  end

  test "should destroy auth_coupon" do
    assert_difference('AuthCoupon.count', -1) do
      delete auth_coupon_url(@auth_coupon)
    end

    assert_redirected_to auth_coupons_url
  end
end
