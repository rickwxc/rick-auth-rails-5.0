require 'test_helper'

class AuthStsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_st = auth_sts(:one)
  end

  test "should get index" do
    get auth_sts_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_st_url
    assert_response :success
  end

  test "should create auth_st" do
    assert_difference('AuthSt.count') do
      post auth_sts_url, params: { auth_st: { auth_gj_id: @auth_st.auth_gj_id, name: @auth_st.name } }
    end

    assert_redirected_to auth_st_url(AuthSt.last)
  end

  test "should show auth_st" do
    get auth_st_url(@auth_st)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_st_url(@auth_st)
    assert_response :success
  end

  test "should update auth_st" do
    patch auth_st_url(@auth_st), params: { auth_st: { auth_gj_id: @auth_st.auth_gj_id, name: @auth_st.name } }
    assert_redirected_to auth_st_url(@auth_st)
  end

  test "should destroy auth_st" do
    assert_difference('AuthSt.count', -1) do
      delete auth_st_url(@auth_st)
    end

    assert_redirected_to auth_sts_url
  end
end
