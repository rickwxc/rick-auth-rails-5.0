json.array!(@auth_shippingrule2objs) do |auth_shippingrule2obj|
  json.extract! auth_shippingrule2obj, :id, :model, :auth_sel_shippingrule_id
  json.url auth_shippingrule2obj_url(auth_shippingrule2obj, format: :json)
end
