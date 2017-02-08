json.array!(@auth_carts) do |auth_cart|
  json.extract! auth_cart, :id, :auth_user_id, :auth_visitor_uuid, :auth_obj_id, :auth_obj_model_name, :auth_obj_qty, :auth_obj_meta_json
  json.url auth_cart_url(auth_cart, format: :json)
end
