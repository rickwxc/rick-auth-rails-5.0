json.array!(@auth_obj_attrs) do |auth_obj_attr|
  json.extract! auth_obj_attr, :id, :model, :obj_id, :auth_meta_type_id, :value, :idx
  json.url auth_obj_attr_url(auth_obj_attr, format: :json)
end
