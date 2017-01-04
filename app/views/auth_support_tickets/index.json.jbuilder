json.array!(@auth_support_tickets) do |auth_support_ticket|
  json.extract! auth_support_ticket, :id, :email, :mobile, :user_id, :note, :meta
  json.url auth_support_ticket_url(auth_support_ticket, format: :json)
end
