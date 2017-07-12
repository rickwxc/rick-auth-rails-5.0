json.array!(@auth_tags) do |auth_tag|
  json.extract! auth_tag, :id, :name, :auth_tagtype_id
  json.url auth_tag_url(auth_tag, format: :json)
end
