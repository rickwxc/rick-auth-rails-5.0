json.array!(@auth_sts) do |auth_st|
  json.extract! auth_st, :id, :name, :auth_gj_id
  json.url auth_st_url(auth_st, format: :json)
end
