json.array!(@auth_gjs) do |auth_gj|
  json.extract! auth_gj, :id, :name
  json.url auth_gj_url(auth_gj, format: :json)
end
