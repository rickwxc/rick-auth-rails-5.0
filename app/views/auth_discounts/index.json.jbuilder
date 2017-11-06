json.array!(@auth_discounts) do |auth_discount|
  json.extract! auth_discount, :id, :model, :obj_id, :amt
  json.url auth_discount_url(auth_discount, format: :json)
end
