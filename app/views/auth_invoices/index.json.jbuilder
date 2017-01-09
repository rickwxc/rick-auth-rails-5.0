json.array!(@auth_invoices) do |auth_invoice|
  json.extract! auth_invoice, :id, :uuid, :gross, :fee, :auth_order_id, :auth_paymethod_id, :auth_invoicest_id
  json.url auth_invoice_url(auth_invoice, format: :json)
end
