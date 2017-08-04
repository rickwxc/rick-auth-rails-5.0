json.array!(@auth_imggroups) do |auth_imggroup|
  json.extract! auth_imggroup, :id, :name, :auth_imggroup_type_id, :maximg, :obj_id, :model
  json.url auth_imggroup_url(auth_imggroup, format: :json)
end
