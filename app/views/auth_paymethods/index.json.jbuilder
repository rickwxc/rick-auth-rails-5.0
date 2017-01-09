json.array!(@auth_paymethods) do |auth_paymethod|
  json.extract! auth_paymethod, :id, :auth_name
  json.url auth_paymethod_url(auth_paymethod, format: :json)
end
