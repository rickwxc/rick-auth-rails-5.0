json.array!(@auth_ordersts) do |auth_orderst|
  json.extract! auth_orderst, :id, :auth_st, :auth_descr
  json.url auth_orderst_url(auth_orderst, format: :json)
end
