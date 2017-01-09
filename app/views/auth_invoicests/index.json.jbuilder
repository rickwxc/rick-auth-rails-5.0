json.array!(@auth_invoicests) do |auth_invoicest|
  json.extract! auth_invoicest, :id, :auth_st
  json.url auth_invoicest_url(auth_invoicest, format: :json)
end
