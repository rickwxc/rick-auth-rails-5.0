json.array!(@auth_obj_attr_types) do |auth_obj_attr_type|
  json.extract! auth_obj_attr_type, :id, :name, :auth_obj_attr_group_id, :idx
  json.url auth_obj_attr_type_url(auth_obj_attr_type, format: :json)
end
