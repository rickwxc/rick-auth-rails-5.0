require 'test_helper'

class AuthUserAddrTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_user_addr_type = auth_user_addr_types(:one)
  end

  test "should get index" do
    get auth_user_addr_types_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_user_addr_type_url
    assert_response :success
  end

  test "should create auth_user_addr_type" do
    assert_difference('AuthUserAddrType.count') do
      post auth_user_addr_types_url, params: { auth_user_addr_type: { name: @auth_user_addr_type.name } }
    end

    assert_redirected_to auth_user_addr_type_url(AuthUserAddrType.last)
  end

  test "should show auth_user_addr_type" do
    get auth_user_addr_type_url(@auth_user_addr_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_user_addr_type_url(@auth_user_addr_type)
    assert_response :success
  end

  test "should update auth_user_addr_type" do
    patch auth_user_addr_type_url(@auth_user_addr_type), params: { auth_user_addr_type: { name: @auth_user_addr_type.name } }
    assert_redirected_to auth_user_addr_type_url(@auth_user_addr_type)
  end

  test "should destroy auth_user_addr_type" do
    assert_difference('AuthUserAddrType.count', -1) do
      delete auth_user_addr_type_url(@auth_user_addr_type)
    end

    assert_redirected_to auth_user_addr_types_url
  end
end
