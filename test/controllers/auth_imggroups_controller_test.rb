require 'test_helper'

class AuthImggroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_imggroup = auth_imggroups(:one)
  end

  test "should get index" do
    get auth_imggroups_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_imggroup_url
    assert_response :success
  end

  test "should create auth_imggroup" do
    assert_difference('AuthImggroup.count') do
      post auth_imggroups_url, params: { auth_imggroup: { auth_imggroup_type_id: @auth_imggroup.auth_imggroup_type_id, maximg: @auth_imggroup.maximg, model: @auth_imggroup.model, name: @auth_imggroup.name, obj_id: @auth_imggroup.obj_id } }
    end

    assert_redirected_to auth_imggroup_url(AuthImggroup.last)
  end

  test "should show auth_imggroup" do
    get auth_imggroup_url(@auth_imggroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_imggroup_url(@auth_imggroup)
    assert_response :success
  end

  test "should update auth_imggroup" do
    patch auth_imggroup_url(@auth_imggroup), params: { auth_imggroup: { auth_imggroup_type_id: @auth_imggroup.auth_imggroup_type_id, maximg: @auth_imggroup.maximg, model: @auth_imggroup.model, name: @auth_imggroup.name, obj_id: @auth_imggroup.obj_id } }
    assert_redirected_to auth_imggroup_url(@auth_imggroup)
  end

  test "should destroy auth_imggroup" do
    assert_difference('AuthImggroup.count', -1) do
      delete auth_imggroup_url(@auth_imggroup)
    end

    assert_redirected_to auth_imggroups_url
  end
end
