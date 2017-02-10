json.array!(@auth_user_addr_types) do |auth_user_addr_type|
  json.extract! auth_user_addr_type, :id, :name
  json.url auth_user_addr_type_url(auth_user_addr_type, format: :json)
end
