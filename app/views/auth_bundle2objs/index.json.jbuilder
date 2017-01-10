json.array!(@auth_bundle2objs) do |auth_bundle2obj|
  json.extract! auth_bundle2obj, :id, :auth_bundle_id, :auth_obj_id, :auth_obj_model_name
  json.url auth_bundle2obj_url(auth_bundle2obj, format: :json)
end
