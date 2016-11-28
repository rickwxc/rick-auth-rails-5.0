json.array!(@imgs) do |img|
  json.extract! img, :id, :modelname, :uuid, :idx, :alt
  json.url img_url(img, format: :json)
end
