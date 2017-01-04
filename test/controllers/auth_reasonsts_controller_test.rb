require 'test_helper'

class AuthReasonstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_reasonst = auth_reasonsts(:one)
  end

  test "should get index" do
    get auth_reasonsts_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_reasonst_url
    assert_response :success
  end

  test "should create auth_reasonst" do
    assert_difference('AuthReasonst.count') do
      post auth_reasonsts_url, params: { auth_reasonst: { st: @auth_reasonst.st } }
    end

    assert_redirected_to auth_reasonst_url(AuthReasonst.last)
  end

  test "should show auth_reasonst" do
    get auth_reasonst_url(@auth_reasonst)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_reasonst_url(@auth_reasonst)
    assert_response :success
  end

  test "should update auth_reasonst" do
    patch auth_reasonst_url(@auth_reasonst), params: { auth_reasonst: { st: @auth_reasonst.st } }
    assert_redirected_to auth_reasonst_url(@auth_reasonst)
  end

  test "should destroy auth_reasonst" do
    assert_difference('AuthReasonst.count', -1) do
      delete auth_reasonst_url(@auth_reasonst)
    end

    assert_redirected_to auth_reasonsts_url
  end
end
