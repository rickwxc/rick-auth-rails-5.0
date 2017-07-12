json.array!(@auth_tag2objs) do |auth_tag2obj|
  json.extract! auth_tag2obj, :id, :model, :auth_obj_id, :auth_tag_id
  json.url auth_tag2obj_url(auth_tag2obj, format: :json)
end
