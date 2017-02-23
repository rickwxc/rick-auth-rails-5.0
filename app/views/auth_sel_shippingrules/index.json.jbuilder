json.array!(@auth_sel_shippingrules) do |auth_sel_shippingrule|
  json.extract! auth_sel_shippingrule, :id, :name, :cost, :idx
  json.url auth_sel_shippingrule_url(auth_sel_shippingrule, format: :json)
end
