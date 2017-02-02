require 'test_helper'

class AuthAddrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_addr = auth_addrs(:one)
  end

  test "should get index" do
    get auth_addrs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_addr_url
    assert_response :success
  end

  test "should create auth_addr" do
    assert_difference('AuthAddr.count') do
      post auth_addrs_url, params: { auth_addr: { auth_sb_id: @auth_addr.auth_sb_id, org: @auth_addr.org, raw_json: @auth_addr.raw_json, street: @auth_addr.street, street_number: @auth_addr.street_number } }
    end

    assert_redirected_to auth_addr_url(AuthAddr.last)
  end

  test "should show auth_addr" do
    get auth_addr_url(@auth_addr)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_addr_url(@auth_addr)
    assert_response :success
  end

  test "should update auth_addr" do
    patch auth_addr_url(@auth_addr), params: { auth_addr: { auth_sb_id: @auth_addr.auth_sb_id, org: @auth_addr.org, raw_json: @auth_addr.raw_json, street: @auth_addr.street, street_number: @auth_addr.street_number } }
    assert_redirected_to auth_addr_url(@auth_addr)
  end

  test "should destroy auth_addr" do
    assert_difference('AuthAddr.count', -1) do
      delete auth_addr_url(@auth_addr)
    end

    assert_redirected_to auth_addrs_url
  end
end
