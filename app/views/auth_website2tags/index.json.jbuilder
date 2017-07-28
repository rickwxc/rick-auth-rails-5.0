json.array!(@auth_website2tags) do |auth_website2tag|
  json.extract! auth_website2tag, :id, :auth_website_id, :auth_tag_id, :idx
  json.url auth_website2tag_url(auth_website2tag, format: :json)
end
