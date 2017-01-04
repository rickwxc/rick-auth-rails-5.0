require 'test_helper'

class AuthReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_reason = auth_reasons(:one)
  end

  test "should get index" do
    get auth_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_reason_url
    assert_response :success
  end

  test "should create auth_reason" do
    assert_difference('AuthReason.count') do
      post auth_reasons_url, params: { auth_reason: { auth_reasonst_id: @auth_reason.auth_reasonst_id, descr: @auth_reason.descr, long: @auth_reason.long, short: @auth_reason.short } }
    end

    assert_redirected_to auth_reason_url(AuthReason.last)
  end

  test "should show auth_reason" do
    get auth_reason_url(@auth_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_reason_url(@auth_reason)
    assert_response :success
  end

  test "should update auth_reason" do
    patch auth_reason_url(@auth_reason), params: { auth_reason: { auth_reasonst_id: @auth_reason.auth_reasonst_id, descr: @auth_reason.descr, long: @auth_reason.long, short: @auth_reason.short } }
    assert_redirected_to auth_reason_url(@auth_reason)
  end

  test "should destroy auth_reason" do
    assert_difference('AuthReason.count', -1) do
      delete auth_reason_url(@auth_reason)
    end

    assert_redirected_to auth_reasons_url
  end
end
