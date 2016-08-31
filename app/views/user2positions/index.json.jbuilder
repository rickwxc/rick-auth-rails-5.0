json.array!(@user2positions) do |user2position|
  json.extract! user2position, :id, :user_id, :position
  json.url user2position_url(user2position, format: :json)
end
