json.array!(@auth_bundles) do |auth_bundle|
  json.extract! auth_bundle, :id, :auth_name, :auth_total
  json.url auth_bundle_url(auth_bundle, format: :json)
end
