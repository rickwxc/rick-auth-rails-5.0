json.array!(@auth_reasons) do |auth_reason|
  json.extract! auth_reason, :id, :long, :short, :descr, :auth_reasonst_id
  json.url auth_reason_url(auth_reason, format: :json)
end
