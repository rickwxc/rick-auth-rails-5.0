json.array!(@auth_sbs) do |auth_sb|
  json.extract! auth_sb, :id, :name, :zip, :auth_st_id
  json.url auth_sb_url(auth_sb, format: :json)
end
