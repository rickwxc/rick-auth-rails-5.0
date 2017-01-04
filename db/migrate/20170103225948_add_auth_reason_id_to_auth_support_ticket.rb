class AddAuthReasonIdToAuthSupportTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_support_tickets, :auth_reason_id, :integer
  end
end
