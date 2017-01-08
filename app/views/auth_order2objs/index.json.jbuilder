json.array!(@auth_order2objs) do |auth_order2obj|
  json.extract! auth_order2obj, :id, :auth_order_id, :auth_total, :auth_gst, :auth_obj_id, :auth_obj_model_name, :auth_obj_display_name, :auth_obj_qty, :auth_obj_unitprice, :auth_obj_meta_json
  json.url auth_order2obj_url(auth_order2obj, format: :json)
end
