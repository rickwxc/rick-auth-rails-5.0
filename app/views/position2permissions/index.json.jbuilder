json.array!(@position2permissions) do |position2permission|
  json.extract! position2permission, :id, :position_id, :permission_id
  json.url position2permission_url(position2permission, format: :json)
end
