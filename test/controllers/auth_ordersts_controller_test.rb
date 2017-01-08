require 'test_helper'

class AuthOrderstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_orderst = auth_ordersts(:one)
  end

  test "should get index" do
    get auth_ordersts_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_orderst_url
    assert_response :success
  end

  test "should create auth_orderst" do
    assert_difference('AuthOrderst.count') do
      post auth_ordersts_url, params: { auth_orderst: { auth_descr: @auth_orderst.auth_descr, auth_st: @auth_orderst.auth_st } }
    end

    assert_redirected_to auth_orderst_url(AuthOrderst.last)
  end

  test "should show auth_orderst" do
    get auth_orderst_url(@auth_orderst)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_orderst_url(@auth_orderst)
    assert_response :success
  end

  test "should update auth_orderst" do
    patch auth_orderst_url(@auth_orderst), params: { auth_orderst: { auth_descr: @auth_orderst.auth_descr, auth_st: @auth_orderst.auth_st } }
    assert_redirected_to auth_orderst_url(@auth_orderst)
  end

  test "should destroy auth_orderst" do
    assert_difference('AuthOrderst.count', -1) do
      delete auth_orderst_url(@auth_orderst)
    end

    assert_redirected_to auth_ordersts_url
  end
end
