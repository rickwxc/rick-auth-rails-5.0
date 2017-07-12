json.array!(@auth_tag2tags) do |auth_tag2tag|
  json.extract! auth_tag2tag, :id, :ptag_id, :ctag_id
  json.url auth_tag2tag_url(auth_tag2tag, format: :json)
end
