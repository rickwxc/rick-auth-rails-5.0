require 'test_helper'

class AuthOrderShippingRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_order_shipping_rule = auth_order_shipping_rules(:one)
  end

  test "should get index" do
    get auth_order_shipping_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_order_shipping_rule_url
    assert_response :success
  end

  test "should create auth_order_shipping_rule" do
    assert_difference('AuthOrderShippingRule.count') do
      post auth_order_shipping_rules_url, params: { auth_order_shipping_rule: { cost: @auth_order_shipping_rule.cost, is_enabled: @auth_order_shipping_rule.is_enabled, name: @auth_order_shipping_rule.name, order_amt: @auth_order_shipping_rule.order_amt } }
    end

    assert_redirected_to auth_order_shipping_rule_url(AuthOrderShippingRule.last)
  end

  test "should show auth_order_shipping_rule" do
    get auth_order_shipping_rule_url(@auth_order_shipping_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_order_shipping_rule_url(@auth_order_shipping_rule)
    assert_response :success
  end

  test "should update auth_order_shipping_rule" do
    patch auth_order_shipping_rule_url(@auth_order_shipping_rule), params: { auth_order_shipping_rule: { cost: @auth_order_shipping_rule.cost, is_enabled: @auth_order_shipping_rule.is_enabled, name: @auth_order_shipping_rule.name, order_amt: @auth_order_shipping_rule.order_amt } }
    assert_redirected_to auth_order_shipping_rule_url(@auth_order_shipping_rule)
  end

  test "should destroy auth_order_shipping_rule" do
    assert_difference('AuthOrderShippingRule.count', -1) do
      delete auth_order_shipping_rule_url(@auth_order_shipping_rule)
    end

    assert_redirected_to auth_order_shipping_rules_url
  end
end
