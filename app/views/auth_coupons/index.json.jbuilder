json.array!(@auth_coupons) do |auth_coupon|
  json.extract! auth_coupon, :id, :code, :name, :val, :expire_at, :is_enabled
  json.url auth_coupon_url(auth_coupon, format: :json)
end
