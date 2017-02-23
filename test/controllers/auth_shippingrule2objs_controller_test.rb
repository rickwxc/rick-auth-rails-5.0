require 'test_helper'

class AuthShippingrule2objsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_shippingrule2obj = auth_shippingrule2objs(:one)
  end

  test "should get index" do
    get auth_shippingrule2objs_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_shippingrule2obj_url
    assert_response :success
  end

  test "should create auth_shippingrule2obj" do
    assert_difference('AuthShippingrule2obj.count') do
      post auth_shippingrule2objs_url, params: { auth_shippingrule2obj: { auth_sel_shippingrule_id: @auth_shippingrule2obj.auth_sel_shippingrule_id, model: @auth_shippingrule2obj.model } }
    end

    assert_redirected_to auth_shippingrule2obj_url(AuthShippingrule2obj.last)
  end

  test "should show auth_shippingrule2obj" do
    get auth_shippingrule2obj_url(@auth_shippingrule2obj)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_shippingrule2obj_url(@auth_shippingrule2obj)
    assert_response :success
  end

  test "should update auth_shippingrule2obj" do
    patch auth_shippingrule2obj_url(@auth_shippingrule2obj), params: { auth_shippingrule2obj: { auth_sel_shippingrule_id: @auth_shippingrule2obj.auth_sel_shippingrule_id, model: @auth_shippingrule2obj.model } }
    assert_redirected_to auth_shippingrule2obj_url(@auth_shippingrule2obj)
  end

  test "should destroy auth_shippingrule2obj" do
    assert_difference('AuthShippingrule2obj.count', -1) do
      delete auth_shippingrule2obj_url(@auth_shippingrule2obj)
    end

    assert_redirected_to auth_shippingrule2objs_url
  end
end
