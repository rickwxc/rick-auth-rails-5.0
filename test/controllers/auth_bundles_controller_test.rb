require 'test_helper'

class AuthBundlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_bundle = auth_bundles(:one)
  end

  test "should get index" do
    get auth_bundles_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_bundle_url
    assert_response :success
  end

  test "should create auth_bundle" do
    assert_difference('AuthBundle.count') do
      post auth_bundles_url, params: { auth_bundle: { auth_name: @auth_bundle.auth_name, auth_total: @auth_bundle.auth_total } }
    end

    assert_redirected_to auth_bundle_url(AuthBundle.last)
  end

  test "should show auth_bundle" do
    get auth_bundle_url(@auth_bundle)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_bundle_url(@auth_bundle)
    assert_response :success
  end

  test "should update auth_bundle" do
    patch auth_bundle_url(@auth_bundle), params: { auth_bundle: { auth_name: @auth_bundle.auth_name, auth_total: @auth_bundle.auth_total } }
    assert_redirected_to auth_bundle_url(@auth_bundle)
  end

  test "should destroy auth_bundle" do
    assert_difference('AuthBundle.count', -1) do
      delete auth_bundle_url(@auth_bundle)
    end

    assert_redirected_to auth_bundles_url
  end
end
