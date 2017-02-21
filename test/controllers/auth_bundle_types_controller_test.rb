require 'test_helper'

class AuthBundleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_bundle_type = auth_bundle_types(:one)
  end

  test "should get index" do
    get auth_bundle_types_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_bundle_type_url
    assert_response :success
  end

  test "should create auth_bundle_type" do
    assert_difference('AuthBundleType.count') do
      post auth_bundle_types_url, params: { auth_bundle_type: { name: @auth_bundle_type.name } }
    end

    assert_redirected_to auth_bundle_type_url(AuthBundleType.last)
  end

  test "should show auth_bundle_type" do
    get auth_bundle_type_url(@auth_bundle_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_bundle_type_url(@auth_bundle_type)
    assert_response :success
  end

  test "should update auth_bundle_type" do
    patch auth_bundle_type_url(@auth_bundle_type), params: { auth_bundle_type: { name: @auth_bundle_type.name } }
    assert_redirected_to auth_bundle_type_url(@auth_bundle_type)
  end

  test "should destroy auth_bundle_type" do
    assert_difference('AuthBundleType.count', -1) do
      delete auth_bundle_type_url(@auth_bundle_type)
    end

    assert_redirected_to auth_bundle_types_url
  end
end
