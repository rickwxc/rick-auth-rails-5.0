require 'test_helper'

class AuthSbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_sb = auth_sbs(:one)
  end

  test "should get index" do
    get auth_sbs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_sb_url
    assert_response :success
  end

  test "should create auth_sb" do
    assert_difference('AuthSb.count') do
      post auth_sbs_url, params: { auth_sb: { auth_st_id: @auth_sb.auth_st_id, name: @auth_sb.name, zip: @auth_sb.zip } }
    end

    assert_redirected_to auth_sb_url(AuthSb.last)
  end

  test "should show auth_sb" do
    get auth_sb_url(@auth_sb)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_sb_url(@auth_sb)
    assert_response :success
  end

  test "should update auth_sb" do
    patch auth_sb_url(@auth_sb), params: { auth_sb: { auth_st_id: @auth_sb.auth_st_id, name: @auth_sb.name, zip: @auth_sb.zip } }
    assert_redirected_to auth_sb_url(@auth_sb)
  end

  test "should destroy auth_sb" do
    assert_difference('AuthSb.count', -1) do
      delete auth_sb_url(@auth_sb)
    end

    assert_redirected_to auth_sbs_url
  end
end
