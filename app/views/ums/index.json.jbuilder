json.array!(@ums) do |um|
  json.extract! um, :id, :user_id, :content, :provider
  json.url um_url(um, format: :json)
end
