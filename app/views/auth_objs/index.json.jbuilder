json.array!(@auth_objs) do |auth_obj|
  json.extract! auth_obj, :id, :auth_name, :auth_uuid, :auth_descr, :auth_total
  json.url auth_obj_url(auth_obj, format: :json)
end
