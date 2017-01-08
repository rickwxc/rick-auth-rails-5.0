json.array!(@auth_paysts) do |auth_payst|
  json.extract! auth_payst, :id, :auth_st
  json.url auth_payst_url(auth_payst, format: :json)
end
