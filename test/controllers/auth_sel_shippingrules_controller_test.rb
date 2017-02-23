require 'test_helper'

class AuthSelShippingrulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_sel_shippingrule = auth_sel_shippingrules(:one)
  end

  test "should get index" do
    get auth_sel_shippingrules_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_sel_shippingrule_url
    assert_response :success
  end

  test "should create auth_sel_shippingrule" do
    assert_difference('AuthSelShippingrule.count') do
      post auth_sel_shippingrules_url, params: { auth_sel_shippingrule: { cost: @auth_sel_shippingrule.cost, idx: @auth_sel_shippingrule.idx, name: @auth_sel_shippingrule.name } }
    end

    assert_redirected_to auth_sel_shippingrule_url(AuthSelShippingrule.last)
  end

  test "should show auth_sel_shippingrule" do
    get auth_sel_shippingrule_url(@auth_sel_shippingrule)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_sel_shippingrule_url(@auth_sel_shippingrule)
    assert_response :success
  end

  test "should update auth_sel_shippingrule" do
    patch auth_sel_shippingrule_url(@auth_sel_shippingrule), params: { auth_sel_shippingrule: { cost: @auth_sel_shippingrule.cost, idx: @auth_sel_shippingrule.idx, name: @auth_sel_shippingrule.name } }
    assert_redirected_to auth_sel_shippingrule_url(@auth_sel_shippingrule)
  end

  test "should destroy auth_sel_shippingrule" do
    assert_difference('AuthSelShippingrule.count', -1) do
      delete auth_sel_shippingrule_url(@auth_sel_shippingrule)
    end

    assert_redirected_to auth_sel_shippingrules_url
  end
end
