require 'test_helper'

class AuthUserAddrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_user_addr = auth_user_addrs(:one)
  end

  test "should get index" do
    get auth_user_addrs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_user_addr_url
    assert_response :success
  end

  test "should create auth_user_addr" do
    assert_difference('AuthUserAddr.count') do
      post auth_user_addrs_url, params: { auth_user_addr: { auth_addr_id: @auth_user_addr.auth_addr_id, auth_user_addr_type: @auth_user_addr.auth_user_addr_type, auth_user_id: @auth_user_addr.auth_user_id, auth_visitor_uuid: @auth_user_addr.auth_visitor_uuid, company: @auth_user_addr.company, firstname: @auth_user_addr.firstname, lastname: @auth_user_addr.lastname, mobile: @auth_user_addr.mobile } }
    end

    assert_redirected_to auth_user_addr_url(AuthUserAddr.last)
  end

  test "should show auth_user_addr" do
    get auth_user_addr_url(@auth_user_addr)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_user_addr_url(@auth_user_addr)
    assert_response :success
  end

  test "should update auth_user_addr" do
    patch auth_user_addr_url(@auth_user_addr), params: { auth_user_addr: { auth_addr_id: @auth_user_addr.auth_addr_id, auth_user_addr_type: @auth_user_addr.auth_user_addr_type, auth_user_id: @auth_user_addr.auth_user_id, auth_visitor_uuid: @auth_user_addr.auth_visitor_uuid, company: @auth_user_addr.company, firstname: @auth_user_addr.firstname, lastname: @auth_user_addr.lastname, mobile: @auth_user_addr.mobile } }
    assert_redirected_to auth_user_addr_url(@auth_user_addr)
  end

  test "should destroy auth_user_addr" do
    assert_difference('AuthUserAddr.count', -1) do
      delete auth_user_addr_url(@auth_user_addr)
    end

    assert_redirected_to auth_user_addrs_url
  end
end
