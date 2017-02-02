require 'test_helper'

class AuthGjsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_gj = auth_gjs(:one)
  end

  test "should get index" do
    get auth_gjs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_gj_url
    assert_response :success
  end

  test "should create auth_gj" do
    assert_difference('AuthGj.count') do
      post auth_gjs_url, params: { auth_gj: { name: @auth_gj.name } }
    end

    assert_redirected_to auth_gj_url(AuthGj.last)
  end

  test "should show auth_gj" do
    get auth_gj_url(@auth_gj)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_gj_url(@auth_gj)
    assert_response :success
  end

  test "should update auth_gj" do
    patch auth_gj_url(@auth_gj), params: { auth_gj: { name: @auth_gj.name } }
    assert_redirected_to auth_gj_url(@auth_gj)
  end

  test "should destroy auth_gj" do
    assert_difference('AuthGj.count', -1) do
      delete auth_gj_url(@auth_gj)
    end

    assert_redirected_to auth_gjs_url
  end
end
