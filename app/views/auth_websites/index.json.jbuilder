json.array!(@auth_websites) do |auth_website|
  json.extract! auth_website, :id, :url, :sendfromemail, :replyemail, :shortname, :title, :descr, :mailapikey, :mailapiurl
  json.url auth_website_url(auth_website, format: :json)
end
