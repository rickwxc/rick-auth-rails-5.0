json.array!(@permissions) do |permission|
  json.extract! permission, :id, :controllername
  json.url permission_url(permission, format: :json)
end
