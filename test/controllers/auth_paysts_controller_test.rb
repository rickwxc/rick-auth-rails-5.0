require 'test_helper'

class AuthPaystsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_payst = auth_paysts(:one)
  end

  test "should get index" do
    get auth_paysts_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_payst_url
    assert_response :success
  end

  test "should create auth_payst" do
    assert_difference('AuthPayst.count') do
      post auth_paysts_url, params: { auth_payst: { auth_st: @auth_payst.auth_st } }
    end

    assert_redirected_to auth_payst_url(AuthPayst.last)
  end

  test "should show auth_payst" do
    get auth_payst_url(@auth_payst)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_payst_url(@auth_payst)
    assert_response :success
  end

  test "should update auth_payst" do
    patch auth_payst_url(@auth_payst), params: { auth_payst: { auth_st: @auth_payst.auth_st } }
    assert_redirected_to auth_payst_url(@auth_payst)
  end

  test "should destroy auth_payst" do
    assert_difference('AuthPayst.count', -1) do
      delete auth_payst_url(@auth_payst)
    end

    assert_redirected_to auth_paysts_url
  end
end
