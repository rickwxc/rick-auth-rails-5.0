json.array!(@auth_user_addrs) do |auth_user_addr|
  json.extract! auth_user_addr, :id, :auth_user_id, :auth_visitor_uuid, :auth_user_addr_type, :auth_addr_id, :firstname, :lastname, :mobile, :company
  json.url auth_user_addr_url(auth_user_addr, format: :json)
end
