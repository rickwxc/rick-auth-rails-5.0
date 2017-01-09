require 'test_helper'

class AuthInvoicestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_invoicest = auth_invoicests(:one)
  end

  test "should get index" do
    get auth_invoicests_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_invoicest_url
    assert_response :success
  end

  test "should create auth_invoicest" do
    assert_difference('AuthInvoicest.count') do
      post auth_invoicests_url, params: { auth_invoicest: { auth_st: @auth_invoicest.auth_st } }
    end

    assert_redirected_to auth_invoicest_url(AuthInvoicest.last)
  end

  test "should show auth_invoicest" do
    get auth_invoicest_url(@auth_invoicest)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_invoicest_url(@auth_invoicest)
    assert_response :success
  end

  test "should update auth_invoicest" do
    patch auth_invoicest_url(@auth_invoicest), params: { auth_invoicest: { auth_st: @auth_invoicest.auth_st } }
    assert_redirected_to auth_invoicest_url(@auth_invoicest)
  end

  test "should destroy auth_invoicest" do
    assert_difference('AuthInvoicest.count', -1) do
      delete auth_invoicest_url(@auth_invoicest)
    end

    assert_redirected_to auth_invoicests_url
  end
end
