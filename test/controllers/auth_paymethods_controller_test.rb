require 'test_helper'

class AuthPaymethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_paymethod = auth_paymethods(:one)
  end

  test "should get index" do
    get auth_paymethods_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_paymethod_url
    assert_response :success
  end

  test "should create auth_paymethod" do
    assert_difference('AuthPaymethod.count') do
      post auth_paymethods_url, params: { auth_paymethod: { auth_name: @auth_paymethod.auth_name } }
    end

    assert_redirected_to auth_paymethod_url(AuthPaymethod.last)
  end

  test "should show auth_paymethod" do
    get auth_paymethod_url(@auth_paymethod)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_paymethod_url(@auth_paymethod)
    assert_response :success
  end

  test "should update auth_paymethod" do
    patch auth_paymethod_url(@auth_paymethod), params: { auth_paymethod: { auth_name: @auth_paymethod.auth_name } }
    assert_redirected_to auth_paymethod_url(@auth_paymethod)
  end

  test "should destroy auth_paymethod" do
    assert_difference('AuthPaymethod.count', -1) do
      delete auth_paymethod_url(@auth_paymethod)
    end

    assert_redirected_to auth_paymethods_url
  end
end
