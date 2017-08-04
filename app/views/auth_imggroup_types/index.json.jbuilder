json.array!(@auth_imggroup_types) do |auth_imggroup_type|
  json.extract! auth_imggroup_type, :id, :name, :acckey
  json.url auth_imggroup_type_url(auth_imggroup_type, format: :json)
end
