json.array!(@auth_tagtypes) do |auth_tagtype|
  json.extract! auth_tagtype, :id, :name
  json.url auth_tagtype_url(auth_tagtype, format: :json)
end
