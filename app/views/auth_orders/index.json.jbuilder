json.array!(@auth_orders) do |auth_order|
  json.extract! auth_order, :id, :auth_user_id, :auth_visitor_uuid, :auth_total, :auth_gst, :auth_orderst_id, :auth_payst_id, :auth_note, :auth_meta_json
  json.url auth_order_url(auth_order, format: :json)
end
