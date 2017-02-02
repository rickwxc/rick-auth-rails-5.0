json.array!(@auth_addrs) do |auth_addr|
  json.extract! auth_addr, :id, :street_number, :street, :auth_sb_id, :org, :raw_json
  json.url auth_addr_url(auth_addr, format: :json)
end
