json.array!(@auth_order_shipping_rules) do |auth_order_shipping_rule|
  json.extract! auth_order_shipping_rule, :id, :name, :cost, :order_amt, :is_enabled
  json.url auth_order_shipping_rule_url(auth_order_shipping_rule, format: :json)
end
