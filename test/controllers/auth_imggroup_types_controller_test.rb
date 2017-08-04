require 'test_helper'

class AuthImggroupTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_imggroup_type = auth_imggroup_types(:one)
  end

  test "should get index" do
    get auth_imggroup_types_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_imggroup_type_url
    assert_response :success
  end

  test "should create auth_imggroup_type" do
    assert_difference('AuthImggroupType.count') do
      post auth_imggroup_types_url, params: { auth_imggroup_type: { acckey: @auth_imggroup_type.acckey, name: @auth_imggroup_type.name } }
    end

    assert_redirected_to auth_imggroup_type_url(AuthImggroupType.last)
  end

  test "should show auth_imggroup_type" do
    get auth_imggroup_type_url(@auth_imggroup_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_imggroup_type_url(@auth_imggroup_type)
    assert_response :success
  end

  test "should update auth_imggroup_type" do
    patch auth_imggroup_type_url(@auth_imggroup_type), params: { auth_imggroup_type: { acckey: @auth_imggroup_type.acckey, name: @auth_imggroup_type.name } }
    assert_redirected_to auth_imggroup_type_url(@auth_imggroup_type)
  end

  test "should destroy auth_imggroup_type" do
    assert_difference('AuthImggroupType.count', -1) do
      delete auth_imggroup_type_url(@auth_imggroup_type)
    end

    assert_redirected_to auth_imggroup_types_url
  end
end
