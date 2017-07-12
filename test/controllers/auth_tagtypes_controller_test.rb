require 'test_helper'

class AuthTagtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_tagtype = auth_tagtypes(:one)
  end

  test "should get index" do
    get auth_tagtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_tagtype_url
    assert_response :success
  end

  test "should create auth_tagtype" do
    assert_difference('AuthTagtype.count') do
      post auth_tagtypes_url, params: { auth_tagtype: { name: @auth_tagtype.name } }
    end

    assert_redirected_to auth_tagtype_url(AuthTagtype.last)
  end

  test "should show auth_tagtype" do
    get auth_tagtype_url(@auth_tagtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_tagtype_url(@auth_tagtype)
    assert_response :success
  end

  test "should update auth_tagtype" do
    patch auth_tagtype_url(@auth_tagtype), params: { auth_tagtype: { name: @auth_tagtype.name } }
    assert_redirected_to auth_tagtype_url(@auth_tagtype)
  end

  test "should destroy auth_tagtype" do
    assert_difference('AuthTagtype.count', -1) do
      delete auth_tagtype_url(@auth_tagtype)
    end

    assert_redirected_to auth_tagtypes_url
  end
end
