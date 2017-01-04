json.array!(@auth_reasonsts) do |auth_reasonst|
  json.extract! auth_reasonst, :id, :st
  json.url auth_reasonst_url(auth_reasonst, format: :json)
end
