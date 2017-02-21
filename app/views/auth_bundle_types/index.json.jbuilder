json.array!(@auth_bundle_types) do |auth_bundle_type|
  json.extract! auth_bundle_type, :id, :name
  json.url auth_bundle_type_url(auth_bundle_type, format: :json)
end
