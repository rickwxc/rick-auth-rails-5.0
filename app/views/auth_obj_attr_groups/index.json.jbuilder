json.array!(@auth_obj_attr_groups) do |auth_obj_attr_group|
  json.extract! auth_obj_attr_group, :id, :name
  json.url auth_obj_attr_group_url(auth_obj_attr_group, format: :json)
end
