require 'test_helper'

class AuthInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_invoice = auth_invoices(:one)
  end

  test "should get index" do
    get auth_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_invoice_url
    assert_response :success
  end

  test "should create auth_invoice" do
    assert_difference('AuthInvoice.count') do
      post auth_invoices_url, params: { auth_invoice: { auth_invoicest_id: @auth_invoice.auth_invoicest_id, auth_order_id: @auth_invoice.auth_order_id, auth_paymethod_id: @auth_invoice.auth_paymethod_id, fee: @auth_invoice.fee, gross: @auth_invoice.gross, uuid: @auth_invoice.uuid } }
    end

    assert_redirected_to auth_invoice_url(AuthInvoice.last)
  end

  test "should show auth_invoice" do
    get auth_invoice_url(@auth_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_invoice_url(@auth_invoice)
    assert_response :success
  end

  test "should update auth_invoice" do
    patch auth_invoice_url(@auth_invoice), params: { auth_invoice: { auth_invoicest_id: @auth_invoice.auth_invoicest_id, auth_order_id: @auth_invoice.auth_order_id, auth_paymethod_id: @auth_invoice.auth_paymethod_id, fee: @auth_invoice.fee, gross: @auth_invoice.gross, uuid: @auth_invoice.uuid } }
    assert_redirected_to auth_invoice_url(@auth_invoice)
  end

  test "should destroy auth_invoice" do
    assert_difference('AuthInvoice.count', -1) do
      delete auth_invoice_url(@auth_invoice)
    end

    assert_redirected_to auth_invoices_url
  end
end
