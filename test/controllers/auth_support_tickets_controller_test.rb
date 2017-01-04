require 'test_helper'

class AuthSupportTicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_support_ticket = auth_support_tickets(:one)
  end

  test "should get index" do
    get auth_support_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_support_ticket_url
    assert_response :success
  end

  test "should create auth_support_ticket" do
    assert_difference('AuthSupportTicket.count') do
      post auth_support_tickets_url, params: { auth_support_ticket: { email: @auth_support_ticket.email, meta: @auth_support_ticket.meta, mobile: @auth_support_ticket.mobile, note: @auth_support_ticket.note, user_id: @auth_support_ticket.user_id } }
    end

    assert_redirected_to auth_support_ticket_url(AuthSupportTicket.last)
  end

  test "should show auth_support_ticket" do
    get auth_support_ticket_url(@auth_support_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_support_ticket_url(@auth_support_ticket)
    assert_response :success
  end

  test "should update auth_support_ticket" do
    patch auth_support_ticket_url(@auth_support_ticket), params: { auth_support_ticket: { email: @auth_support_ticket.email, meta: @auth_support_ticket.meta, mobile: @auth_support_ticket.mobile, note: @auth_support_ticket.note, user_id: @auth_support_ticket.user_id } }
    assert_redirected_to auth_support_ticket_url(@auth_support_ticket)
  end

  test "should destroy auth_support_ticket" do
    assert_difference('AuthSupportTicket.count', -1) do
      delete auth_support_ticket_url(@auth_support_ticket)
    end

    assert_redirected_to auth_support_tickets_url
  end
end
